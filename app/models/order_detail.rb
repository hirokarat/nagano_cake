class OrderDetail < ApplicationRecord
  
  def subtotal
    purchase_price*amount
  end
  
  belongs_to :item
	belongs_to :order
  
end
