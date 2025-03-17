<div id="dates-calendar" class="dates-calendar"></div>

<div id="modal-calendar" class="modal fade">
    <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="form_modal_calendar form-horizontal" novalidate onsubmit="return false">
                    <div class="form-group">
                        <label >{{ trans('core/base::tables.status') }}</label>
                        <br>
                        <label ><input type="checkbox" true-value="1" false-value="0" v-model="form.active"> {{ trans('plugins/hotel::room.form.is_available') }}</label>
                    </div>
                    <div class="row">
                        <div class="col-md-6" v-show="form.active">
                            <div class="form-group">
                                <label for="price-input">Normal {{ trans('plugins/hotel::room.form.price') }}</label>
                                <input type="number" 
                                    id="price-input" 
                                    v-model="form.price" 
                                    class="form-control">
                            </div>
                        </div>
                        <div class="col-md-6" v-show="form.active">
                            <div class="form-group">
                                <label for="discount-input">{{ trans('plugins/hotel::room.form.discount') }}</label>
                                <div class="input-group">
                                    <input type="number"  
                                        class="hidden"
                                        style="display: none;"
                                        hidden
                                        min="0"
                                        v-model="form.discount">
                                    <input type="number" 
                                        id="discount-input" 
                                        class="form-control" 
                                        min="0">
                                    <div class="input-group-append">
                                        <select 
                                            id="discount-type-select"
                                            class="form-control" 
                                            style="border-top-left-radius: 0; border-bottom-left-radius: 0;">
                                            <option value="percentage">%</option>
                                            <option value="fixed">{{ get_application_currency()->symbol }}</option>
                                        </select>
                                    </div>
                                </div>
                                <small class="form-text text-muted" id="discount-equivalent"></small>
                            </div>
                        </div>
                        <div class="col-md-6" v-show="form.active">
                            <div class="form-group">
                                <label for="number-of-rooms">{{ trans('plugins/hotel::room.form.number_of_rooms') }}</label>
                                <input type="number" id="number-of-rooms" v-model="form.number_of_rooms" class="form-control">
                            </div>
                        </div>
                        
                        <div class="col-md-6" v-show="form.active">
                            <div class="form-group">
                                <label for="note-to-admin">{{ trans('plugins/hotel::room.form.note_to_admin') }}</label>
                                <textarea id="note-to-admin" v-model="form.note_to_admin" class="form-control">
                                </textarea>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">{{ trans('plugins/hotel::room.form.close') }}</button>
                <button type="button" class="btn btn-primary" @click="saveForm">{{ trans('plugins/hotel::room.form.save_changes') }}</button>
            </div>
        </div>
    </div>
</div>

<div data-get-room-availability-url="{{ route('room.availability', $object->id) }}"></div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const currencySymbol = '{{ get_application_currency()->symbol }}';
    
    // Function to initialize Vue instance
    function initializeVueInstance(vueInstance) {
        // Initialize data properties
        if (!vueInstance.$data.discountType) {
            vueInstance.$data.discountType = 'percentage';
        }
        if (!vueInstance.$data.discountEquivalentText) {
            vueInstance.$data.discountEquivalentText = '';
        }
        if (!vueInstance.$data.currencySymbol) {
            vueInstance.$data.currencySymbol = currencySymbol;
        }

        // Add methods
        vueInstance.updateEquivalentValue = function() {
            const price = parseFloat(vueInstance.$data.form.price) || 0;
            const visibleDiscount = parseFloat(document.getElementById('discount-input').value) || 0;
            
            if (!price || !visibleDiscount) {
                vueInstance.$data.discountEquivalentText = '';
                document.getElementById('discount-equivalent').textContent = '';
                return;
            }

            if (vueInstance.$data.discountType === 'fixed') {
                const percentage = visibleDiscount >= price ? 100 : Math.round((visibleDiscount / price) * 100);
                vueInstance.$data.discountEquivalentText = `Equivalent to ${percentage}%`;
            } else {
                const fixedAmount = (price * visibleDiscount / 100).toFixed(2);
                vueInstance.$data.discountEquivalentText = `Equivalent to ${vueInstance.$data.currencySymbol}${fixedAmount}`;
            }
            document.getElementById('discount-equivalent').textContent = vueInstance.$data.discountEquivalentText;
        };

        vueInstance.handleDiscountTypeChange = function(e) {
            const price = parseFloat(vueInstance.$data.form.price) || 0;
            const hiddenDiscount = parseFloat(vueInstance.$data.form.discount) || 0;
            const discountInput = document.getElementById('discount-input');
            
            if (price && discountInput) {
                if (vueInstance.$data.discountType === 'fixed') {
                    // Convert percentage to fixed amount
                    const fixedAmount = (price * hiddenDiscount / 100).toFixed(2);
                    discountInput.value = fixedAmount;
                } else {
                    // Already in percentage, show the hidden value
                    discountInput.value = hiddenDiscount;
                }
            }
            
            this.updateEquivalentValue();
        };

        vueInstance.handleDiscountInput = function(e) {
            const price = parseFloat(vueInstance.$data.form.price) || 0;
            const visibleDiscount = parseFloat(e.target.value) || 0;
            
            if (price && visibleDiscount) {
                if (vueInstance.$data.discountType === 'fixed') {
                    if (visibleDiscount >= price) {
                        e.target.value = price;
                        vueInstance.$data.form.discount = 100;
                    } else {
                        // Convert fixed amount to percentage
                        const percentage = (visibleDiscount / price) * 100;
                        vueInstance.$data.form.discount = percentage;
                    }
                } else {
                    if (visibleDiscount > 100) {
                        e.target.value = 100;
                        vueInstance.$data.form.discount = 100;
                    } else {
                        vueInstance.$data.form.discount = visibleDiscount;
                    }
                }
            }
            this.updateEquivalentValue();
        };

        vueInstance.handlePriceInput = function() {
            this.updateEquivalentValue();
        };

        // Watch for form data changes
        vueInstance.$watch('form', (newVal) => {
            if (newVal && newVal.price !== undefined && newVal.discount !== undefined) {
                const discountInput = document.getElementById('discount-input');
                const discountTypeSelect = document.getElementById('discount-type-select');
                
                if (discountInput && discountTypeSelect) {
                    // Set initial discount type
                    discountTypeSelect.value = vueInstance.$data.discountType;
                    
                    // Set initial discount value based on type
                    const hiddenDiscount = parseFloat(newVal.discount) || 0;
                    const price = parseFloat(newVal.price) || 0;
                    
                    if (vueInstance.$data.discountType === 'fixed') {
                        // Convert percentage to fixed amount
                        const fixedAmount = (price * hiddenDiscount / 100).toFixed(2);
                        discountInput.value = fixedAmount;
                    } else {
                        // Already in percentage
                        discountInput.value = hiddenDiscount;
                    }
                    
                    // Update equivalent text
                    vueInstance.updateEquivalentValue();
                }
            }
        }, { immediate: true });

        // Bind event handlers programmatically
        vueInstance.$nextTick(() => {
            const priceInput = document.getElementById('price-input');
            const discountInput = document.getElementById('discount-input');
            const discountTypeSelect = document.getElementById('discount-type-select');
            const modalCalendar = document.getElementById('modal-calendar');

            if (priceInput) {
                priceInput.addEventListener('input', () => vueInstance.handlePriceInput());
            }
            if (discountInput) {
                discountInput.addEventListener('input', (e) => vueInstance.handleDiscountInput(e));
            }
            if (discountTypeSelect) {
                // Set initial value
                discountTypeSelect.value = vueInstance.$data.discountType;
                
                discountTypeSelect.addEventListener('change', (e) => {
                    vueInstance.$data.discountType = e.target.value;
                    vueInstance.handleDiscountTypeChange(e);
                });
            }
        });
    }

    // Poll for Vue instance
    let attempts = 0;
    const maxAttempts = 50; // 5 seconds maximum wait time
    const pollInterval = setInterval(() => {
        const vueInstance = document.querySelector('#modal-calendar').__vue__;
        if (vueInstance) {
            initializeVueInstance(vueInstance);
            clearInterval(pollInterval);
            return;
        }
        
        attempts++;
        if (attempts >= maxAttempts) {
            clearInterval(pollInterval);
            console.warn('Vue instance not found after maximum attempts');
        }
    }, 100);
});
</script>
