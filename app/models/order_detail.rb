class OrderDetail < ApplicationRecord
  
  def subtotal
    purchase_price*amount
  end
  
  belongs_to :item
	belongs_to :order
	
	enum maiking_status: { 製作不可: 0, 製作待ち: 1, 製作中: 3, 製作完了: 4 }
  
end
