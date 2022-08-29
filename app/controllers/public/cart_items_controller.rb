class Public::CartItemsController < ApplicationController
  
  before_action :authenticate_customer!
  before_action :baria_user, only: [:update, :destroy]
  
  def index
    @cart_items = current_customer.cart_items
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(amount: params[:cart_item][:amount])
    flash[:notice] = "#{@cart_item.item.name}の数量を変更しました。"
    redirect_to public_cart_items_path
  end

  def destroy
  end

  def destroy_all
  end

  def create  
    @cart_item = current_customer.cart_items.new(params_cart_item)
    @update_cart_item = CartItem.find_by(item: @cart_item.item)
    if @update_cart_item.present? && @cart_item.valid?
      @cart_item.amount += @update_cart_item.amount
      @update_cart_item.destroy
    end
    if @cart_item.save
      flash[:notice] = "#{@cart_item.item.name}をカートに追加しました。"
      redirect_to public_cart_items_path
    else
      @item = Item.find(params[:cart_item][:item_id])
      @cart_item = CartItem.new
      flash[:alert] = "個数を選択してください。"
      render "public/items/show"
    end
  end
  
  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
  
  def baria_user
    unless CartItem.find(params[:id]).customer.id.to_i == current_customer.id
      redirect_to customer_customer_path
    end
  end
  
end
