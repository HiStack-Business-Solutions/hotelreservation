<div data-room-adults="{{$room->max_adults}}" data-room-children="{{$room->max_children}}" 
        data-room="{{$room->id}}" @if(!$checkout) hidden @endif class="animate-fadeIn p-2 rounded" style="position: relative">
    <input data-room="{{$room->id}}" hidden name="rooms[{{$room->id}}]" type="number"/>
    <div class="d-flex flex-row" style="font-size: small; padding: 3px 5px; position: absolute; top: 15px; left: 15px;">
        <span class="rounded col d-flex align-items-center py-1" style="font-size:smaller; background-color: #bead8e; color: #fff; text-transform: uppercase;">{{ $room->name }}</span>
        <span class="rounded col d-flex align-items-center" style="background-color: black; color: white;">x<span data-qty-book="{{$room->id}}">{{ '1' }}</span>&nbsp;room(s)</span>
        @if (!$checkout)
        <div class="rounded d-flex align-items-center qty">
            <span data-plusbook class="minus bg-dark mx-1" onclick="minus('{{ $room->id }}')">-</span>
            <span data-minusbook class="plus bg-dark mx-1" onclick="plus('{{ $room->id }}')">+</span>
        </div>
        @endif
    </div>
    <img style="height: 100px; width: 400px; object-fit: cover;" class="rounded img-fluid" src="{{ RvMedia::getImageUrl($room->image, '380x280', false, RvMedia::getDefaultImage()) }}" alt="{{ $room->name }}">
</div>