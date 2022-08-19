class Admin::OrdersController < ApplicationController
  
  
  
  def index
    @orders=Order.all
  end
  
  def show
    @order=Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order_details= @order.order_details
    @order.update(order_params)
    if @order.order_status === "入金確認"
      order_details.each do |order_detail|
        order_detail.update(order_detail_params)
      end
    end
    @orders = Order.page(params[:page]).per(10)
    redirect_to admin_top_path
  end

  
  
  private

    def order_detail_params
      params.permit(:maiking_status).merge(maiking_status: 1)
    end

    def order_params
      params.require(:order).permit(:order_status).merge(order_status: params[:order][:order_status].to_i)
    end
  
end
