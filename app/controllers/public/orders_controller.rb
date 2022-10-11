class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.item_id = cart_item.item_id
        order_detail.order_id = @order.id
        order_detail.amount = cart_item.amount
        @cart_items = current_customer.cart_items.all
        @total = @cart_items.inject(0) { |sum, item| sum + item.sub_total }
        order_detail.price = @total
        order_detail.save
      end
      redirect_to orders_complete_path
      cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def comfirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:select_address] == "2"
      @address = Address.new(address_params)
      @address.customer_id = current_customer.id
      @address.save
    end
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sub_total }
    @order.shopping_cost = 800
    @order.total_payment = @total + @order.shopping_cost
  end

  def complete
  end

  def index
    @orders = current_customer.orders.all
  end

  def show
    @order = current_customer.orders.find(params[:id])
    
  end

  private
  def order_params
    params.require(:order).permit(:customer_id,:postal_code,:address,:name,:shopping_cost,:total_payment,:payment_method,:status)
  end

  def address_params
    params.require(:order).permit(:name,:postal_code,:address)
  end

end
