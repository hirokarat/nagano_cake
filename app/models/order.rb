class Order < ApplicationRecord

    has_many :order_detail, dependent: :destroy
    belongs_to :customer

    # 注文の全ての数量合計
    def sum_order_items
        self.item_orders.all.sum(:quantity)
    end
    
    #注文の合計金額
    def total_price
        array = []
        self.item_orders.each do |item_order|
           array << item_order.tax_price * item_order.quantity
       end
        array.sum
    end
    
    
  
    enum payment_method:{credit_card:0,transfer:1}
  
end
