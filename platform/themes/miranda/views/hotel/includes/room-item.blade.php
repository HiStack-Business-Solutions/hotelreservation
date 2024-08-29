@php
    use Carbon\Carbon;

    try {
        $startDate = Carbon::createFromFormat('d-m-Y', request()->query('start_date', now()->format('d-m-Y')))->format('Y-m-d');
        $endDate = Carbon::createFromFormat('d-m-Y', request()->query('end_date', now()->addDay()->format('d-m-Y')))->format('Y-m-d');
    } catch (\Exception $e) {
        $startDate = now()->format('Y-m-d');
        $endDate = now()->addDay()->format('Y-m-d');
    }

    $filteredDates = $room->roomDatesTwo->filter(function ($item) use ($room, $startDate, $endDate) {
        try {
            $itemStartDate = Carbon::parse($item['start_date'])->format('Y-m-d');
            $itemEndDate = Carbon::parse($item['end_date'])->format('Y-m-d');
        } catch (\Exception $e) {
            return false;
        }
        
        return $item['room_id'] == $room->id &&
            $itemStartDate == $startDate;
    });
   // dd($room->roomDatesTwo);
@endphp
@php
    $totalOriginalPrice = 0;
    $totalDiscountedPrice = 0;
    foreach ($filteredDates as $roomss) {
        $pricePerNight = $roomss['price'];
        $discount = !empty($roomss['discount']) ? $roomss['discount'] : 0;
        $discountedPrice = $pricePerNight * (1 - $discount / 100);
        $totalOriginalPrice += $pricePerNight;
        $totalDiscountedPrice += $discountedPrice;
    }
    $totalOriginalPrice *= (isset($nights) ? $nights : 1);
    $totalDiscountedPrice *= (isset($nights) ? $nights : 1);
@endphp
<div class="room-box mb-30">
    <div class="room-img-wrap">
        <div class="room-img" style="background-image: url({{ RvMedia::getImageUrl($room->image, '380x280', false, RvMedia::getDefaultImage()) }});"></div>
    </div>
    <div class="room-desc">
        @if (count($room->amenities) > 0)
            <ul class="icons">
                @foreach($room->amenities->take(7) as $amenity)
                    <li><i class="{{ $amenity->icon }}"></i></li>
                @endforeach
            </ul>
        @endif

        <div class="text-left">
        <h4 class="title"><a href="{{ $room->url }}">{{ $room->name }}</a></h4>
        <break class="mb-10"><a>Room Available : </a>
            <a href="{{ $room->url }}">
                @if ($filteredDates->isEmpty())
                    {{ $room->number_of_rooms }}
                @else
                    @foreach ($filteredDates as $roomss)
                        {{ !empty($roomss['number_of_rooms']) ? $roomss['number_of_rooms'] : $room->number_of_rooms }}
                    @endforeach
                @endif  
            </a>
        </break>
        <br class="mb-10"><a>Capacity : </a>
            <a href="{{ $room->url }}">
                {{ $room->max_adults }} + {{ $room->max_children }} anak kecil
            </a>
        </br>
        <p class="mb-10"><a>Discount : </a>
            <a href="{{ $room->url }}">
                @if ($filteredDates->isEmpty())
                    0
                @else
                    @foreach ($filteredDates as $roomss)
                        {{ !empty($roomss['discount']) ? $roomss['discount'] : 0 }}
                    @endforeach
                @endif %
            </a>
        </p>

<p class="mb-10">{{ $room->description }}</p>
<form action="{{ route('public.booking') }}" method="POST">
    @csrf
    <input type="hidden" name="room_id" value="{{ $room->id }}">
    <input type="hidden" name="start_date" value="{{ request()->query('start_date', now()->format('d-m-Y')) }}">
    <input type="hidden" name="end_date" value="{{ request()->query('end_date', now()->addDay()->format('d-m-Y')) }}">
    <input type="hidden" name="adults" value="{{ request()->query('adults', 1) }}">
    <button type="submit" class="main-btn btn-filled booking-button">

        @if ($filteredDates->isEmpty())
            {{ __('Booking :price', ['price' => format_price($room->price * (isset($nights) ? $nights : 1))]) }}
        @else
            {!! __('Booking :price/<span style="text-decoration: line-through;">:originalPrice</span>', [
                'price' => format_price($totalDiscountedPrice),
                'originalPrice' => format_price($totalOriginalPrice)
            ]) !!}
        @endif  
    </button>
</form>
        </div>
    </div>
</div>
