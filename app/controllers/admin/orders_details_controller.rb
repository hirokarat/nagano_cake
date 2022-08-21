class Admin::OrdersDetailsController < ApplicationController
  def update
    order_detail = OrderDetail.find(params[:id])
    order_detail = OrderDetail.where(order_id: order_detail.order_id)
    order = order_detail.order
    item_order.update(item_order_params)
    if item_orders.all?{ |item_order| item_order.maiking_status === "製作完了" }
      order.update(complete_order_params)
    else
      if item_order.maiking_status === "製作中"
        order.update(order_params)
      end
    end
    redirect_to admin_order_path(item_order.order_id)
  end
end
