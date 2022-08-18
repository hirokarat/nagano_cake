class CartItem < 
  belongs_to :customer
  belongs_to :item

  validates :quantity, numericality: { only_integer: true }

end
