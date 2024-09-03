<section class="room-section room-grid-style">
    <style>
        .add-booking-btn {
            padding: 7px 12px;
            line-height: 20px;
            background-color: #100800bf !important;
            color: #777;
            box-shadow: none;
            font-size: 12px;
        }
        .add-booking-btn:hover {
            background-color: #fff1e2bf !important;
            color: #777;
        }
        .animate-fadeIn {
            animation: fadeIn 500ms ease-out backwards;
        }

        @keyframes fadeIn {
            from {
                transform: translateX(100px);
                opacity: 0;
            }
            to {
                transform: translateX(0px);
                opacity: 1;
            }
        }
        
        .animate-blink {
            animation: blinker 2s linear;
        }
        @keyframes blinker {
            0% {
                background-color: #fff1e2bf;
                opacity: 1;
            }
            50% {
                opacity: 0;
            }
            100% {
                background-color: #fff1e2bf;
                opacity: 1;
            }
        }
    </style>
    <div class="container">
        <h3>{{ __(':count rooms available', ['count' => count($rooms)]) }}</h3>
        <br>
        <div class="row">
            <!-- details -->
            <div class="col-lg-8">
                <div class="row justify-content-center room-gird-loop">
                    @foreach($rooms as $room)
                        <div class="col-sm-6">
                            @include(Theme::getThemeNamespace() . '::views.hotel.includes.room-item', compact('room', 'nights', 'categories'))
                        </div>
                    @endforeach
                </div>
                @if (method_exists($rooms, 'links'))
                    <div class="pagination-wrap">
                        {!! $rooms->links() !!}
                    </div>
                @endif
            </div>
            <!-- form -->
            <div class="col-lg-4 col-md-8 col-sm-10">
                <div class="row-lg-4 my-4">
                    <div class="room-details m-2">
                        @include(Theme::getThemeNamespace() . '::views.hotel.includes.check-availability', array_merge(['availableForBooking' => false], compact('categories')) )
                    </div>
                    <div class="sidebar m-2">
                        @include(Theme::getThemeNamespace() . '::views.hotel.includes.multiple-checkout', array_merge(['availableForBooking' => false, 'checkout' => false, 'roomBookings'=> []], compact('rooms', 'categories')) )
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

