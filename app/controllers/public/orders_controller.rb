class Public::OrdersController < ApplicationController
  
  before_action :to_confirm, only: [:show]
  before_action :authenticate_customer!
  
  def new
    @order = Order.new
    @addresses= Address.where(customer: current_customer)
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new
    @order.tax_price = billing(@order)
    if params[:order][:addresses] == "residence"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:addresses] == "name"
      delivery = Address.find(params[:order][:address_id]) 
      @order.postcode = delivery.postal_code
      @order.address = delivery.address
      @order.name = delivery.name
    elsif params[:order][:addresses] == "new_address"
      @order.postal_code = params[:order][:postcode]
      @order.address = params[:order][:address]
      @order.name = params[:order][:destination]
      @delivery = "1"
    end
  end

  def complete
  end

  def create
  end

  def index
  end

  def show
  end
  
  private
  def order_params
    params.require(:order).permit(:tax_price, :payment, :postal_code, :address, :name)
  end
  
  def address_params
    params.require(:order).permit(:postal_code, :address, :name)
  end
  
  def to_confirm
    redirect_to customer_items_path if params[:id] == "confirm"
  end
  
end
