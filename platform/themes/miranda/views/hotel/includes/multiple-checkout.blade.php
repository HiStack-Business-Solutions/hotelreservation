<script>
function htmlToNode(html) {
    const template = document.createElement('template');
    template.innerHTML = html;
    const nNodes = template.content.childNodes.length;
    if (nNodes !== 1) {
        throw new Error(
            `html parameter must represent a single node; got ${nNodes}. ` +
            'Note that leading or trailing spaces around an element in your ' +
            'HTML, like " <img/> ", get parsed as text nodes neighbouring ' +
            'the element; call .trim() on your input to avoid this.'
        );
    }
    return template.content.firstChild;
}
function saveForm() {
    localStorage.setItem("hotelreservation_room_booking", JSON.stringify(booking_storage));
}
function calculateBookingMaxCaps(form) {
    let adults = 0;
    let children = 0;
    form.querySelectorAll('div[data-room]').forEach(div => {
        let roomid = div.getAttribute("data-room");
        if (div.querySelector('input[data-room]').value <= 0) {
            return;
        }
        adults += Number(div.getAttribute("data-room-adults")) * room_booking_items[roomid];
        children += Number(div.getAttribute("data-room-children")) * room_booking_items[roomid];
    });
    $(form).find('#span-max-adults').text(adults);
    $(form).find('#span-max-children').text(children);
}
async function setBookForRoom(roomid, qty) {
    let form = document.getElementById("multi-booking");
    let div = form.querySelector(`div[data-room='${roomid}']`);
    let maxRooms = Number(div.getAttribute("data-room-maxrooms"));
    if (qty > maxRooms) {
        return;
    }
    if (!div) {
        let resp = await fetch("{{route('public.rooms.bookitem', 'data-roomid')}}".replace("data-roomid", roomid))
        if (resp.ok) {
            let html = await resp.text();
            div = htmlToNode(html);
            document.getElementById("selected-book-rooms").appendChild(div);
        }
        else {
            return;
        }
    }

	let input = div.querySelector(`input[data-room='${roomid}']`);
    if (input) {
        room_booking_items[roomid] = qty;
        input.value = qty;
        calculateBookingMaxCaps(form);
        div.scrollIntoView({
            behavior: 'smooth',
            block: 'center',
            inline: 'center'
        });
        saveForm();
    }
    if (input && qty > 0) {
        div.removeAttribute("hidden");
        form.removeAttribute("hidden");
    } else if (input && qty <= 0) {
        div.setAttribute("hidden", "");
    }
    if (qty >= maxRooms) {
        div.querySelector("span[data-plusbook]").setAttribute("hidden", "");
    } else {
        div.querySelector("span[data-plusbook]").removeAttribute("hidden");
    }
    
	let span = div.querySelector(`span[data-qty-book='${roomid}']`);
    if (span)
        span.innerText = qty;
}
function getBookForRoom(roomid) {
    let value = room_booking_items[roomid];
    if (value) {
        return Number(value);
    }
    return 0;
}
async function plus(roomid) {
    let value = getBookForRoom(roomid) + 1;
    await setBookForRoom(roomid, value);
}
async function minus(roomid) {
    let value = getBookForRoom(roomid) - 1;
    await setBookForRoom(roomid, value);
}
async function initBooking(storage) {
    let bookings = {};
    for (var checkin in storage) {
        let checkins = storage[checkin];
        booking_storage[checkin] = checkins;
        for (var checkout in checkins) {
            if (checkin == START_DATE && checkout == END_DATE) {
                bookings = checkins[checkout];
                break;
            }
        }
    }
    for (var roomid in bookings) { 
        let qty = bookings[roomid];
        room_booking_items[roomid] = qty; 
        await setBookForRoom(roomid, qty);
    }
    return bookings;
}
async function init() {
    let cache = localStorage.getItem("hotelreservation_room_booking");
    let storage = JSON.parse(cache);
    let bookings;
    if (storage) {
        bookings = await initBooking(storage);
    }
    
    let form = document.getElementById("multi-booking");
    if ('{{$checkout}}' || (bookings && Object.keys(bookings).filter(x => bookings[x] > 0).length > 0)) {
        form.removeAttribute("hidden");
    }
    form.addEventListener('submit', () => {
        let chi = booking_storage[START_DATE];
        if (chi) {
            chi[END_DATE] && delete chi[END_DATE];
        }
        saveForm();
    }, false);
}
const START_DATE = "{{request()->query('start_date', now()->format('d-m-Y'))}}";
const END_DATE = "{{request()->query('end_date', now()->addDay()->format('d-m-Y'))}}";
const room_booking_items = {};
const booking_storage = {[START_DATE]: { [END_DATE]: room_booking_items }};
document.addEventListener('DOMContentLoaded',init,false);

</script>
<style>
.qty .plus {
    cursor: pointer;
    display: inline-block;
    vertical-align: top;
    color: white;
    width: 15px;
    height: 15px;
    font: 13px/1 Arial,sans-serif;
    text-align: center;
    border-radius: 50%;
    }
.qty .minus {
    cursor: pointer;
    display: inline-block;
    vertical-align: top;
    color: white;
    width: 15px;
    height: 15px;
    font: 12px/1 Arial,sans-serif;
    text-align: center;
    border-radius: 50%;
    background-clip: padding-box;
}
.minus:hover, .plus:hover{
    background-color: #717fe0 !important;
}

.minus:active, .plus:active{
    background-color: #3e467a !important;
}
         
</style>
@if(!$checkout)
<form hidden action="{{route('public.booking')}}" method="post" id="multi-booking" class="animate-fadeIn rounded-lg" style="background-color: rgb(43 43 43); font-family: 'Old Standard TT', serif; color: #fff; font-size: 14px;">
    @csrf
@else
<div id="multi-booking" class="animate-fadeIn rounded-lg" style="background-color: rgb(43 43 43); font-family: 'Old Standard TT', serif; color: #fff; font-size: 14px;">
@endif
    @if(!$checkout)
    <input type="hidden" name="multiple_booking" value="true">
    <input type="hidden" name="start_date" value="{{ request()->query('start_date', now()->format('d-m-Y')) }}">
    <input type="hidden" name="end_date" value="{{ request()->query('end_date', now()->addDay()->format('d-m-Y')) }}">
    <input type="hidden" name="adults" value="{{ request()->query('adults', 0) }}">
    @endif
    <div class="p-2" >
        <span class="rounded p-2" style="background: #696969;color: #ffffff;">Your Bookings</span>
    </div>
    <div id="selected-book-rooms">
    @foreach ($rooms as $room)
    @include(Theme::getThemeNamespace() . '::views.hotel.includes.book-room-item', compact('room', 'checkout', 'roomBookings') )
    @endforeach
    </div>
    <div style="padding: 20px; background-color: #bead8e;">
        <div class="text-center mb-20">
            <p>{{ __('YOUR RESERVATION') }}</p>
        </div>
        <div>
            @if($checkout)
            <p>{{ __('Check-In') }}: {{ $startDate->format('d-m-Y') }}</p>
            <p>{{ __('Check-Out') }}: {{ $endDate->format('d-m-Y') }}</p>
            <p>{{ __('Total Max Capacity') }}: {{$max_adults}} adults + {{$max_children}} children</p>
            <p>{{ __('Tax') }}: {{ format_price($taxAmount) }}</p>
            <p>{{ __('Discount') }}: -{{ format_price($discount_amount) }}</p>
            @else
            <p>{{ __('Check-In') }}: {{ request()->query('start_date', now()->format('d-m-Y')) }}</p>
            <p>{{ __('Check-Out') }}: {{ request()->query('end_date', now()->addDay()->format('d-m-Y')) }}</p>
            <p>{{ __('Total Max Capacity') }}: <span id="span-max-adults"></span> adults + <span id="span-max-children"></span> children</p>
            @endif
        </div>
    </div>
    @if($checkout)
    <div class="pb-20 pt-20 text-center" style="font-size: 30px; background-color: #151516;">
        <p>{{ __('Total') }}: <span class="total-amount-text">@if($checkout){{ format_price($total) }} @else - @endif</span><span id="extra_bed_total_wrooms"></span></p>
    </div>
    @endif
    @if(!$checkout)
    <div class="input-group">
        <button type="submit" class="self-align-center main-btn btn-filled add-booking-btn col p-3 m-3">{{ __('Book All Now') }}</button>
    </div>
    @endif
@if(!$checkout)
</form>
@else
</div>
@endif