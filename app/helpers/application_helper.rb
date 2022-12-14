module ApplicationHelper
  
  def tax_price(price)
    (price * 1.1).floor
  end

  def sub_price(sub)
    (tax_price(sub.item.price) * sub.amount)
  end

  def total_price(totals)
    price = 0
    totals.each do |total|
      price += sub_price(total)
    end
    return price
  end
  
  def current_cart
    @cart_items = current_customer.cart_items
  end
  
  
  
  
end
