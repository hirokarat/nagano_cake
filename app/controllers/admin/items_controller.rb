class Admin::ItemsController < ApplicationController
  def index
    @items=Item.all
  end

  def new
    @item=Item.new
  end

  def create
    @item=Item.new(item_params)
    @item.save
    redirect_to '/admin/items'
  end

  def show
    @item=Item.find(params[:id])
  end

  def edit
    @item=Item.find(params[:id])
  end

  def update
    @item=Item.find(params[:id])
    @item.update
    redirect_to '/admin/items'
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name,:introduction,:price,:image,:is_active,:genre_id)
  end
end
