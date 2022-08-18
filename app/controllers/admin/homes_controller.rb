class Admin::HomesController < ApplicationController
  def top
    @orders=Order.all
    @order=Order.count
  end
end
