class Admin::PriceBasedShippingRatesController < Admin::AppController
  prepend_before_filter :authenticate_user!
  layout 'admin'
  expose(:shop){ current_user.shop }
  expose(:shippings) { shop.shippings }
  expose(:shipping)
  expose(:price_based_shipping_rates) { shipping.price_based_shipping_rates }
  expose(:price_based_shipping_rate)

  def create
    price_based_shipping_rate.save
    render json: price_based_shipping_rate
  end

  def destroy
    price_based_shipping_rate.destroy
    render json: price_based_shipping_rate
  end

  def update
    if price_based_shipping_rate.save
      redirect_to edit_shipping_price_based_shipping_rate_path(shipping, price_based_shipping_rate),notice: notice_msg
    else
      render action: 'edit'
    end
  end
end
