class Item < ApplicationRecord
  
  has_one_attached:image
  
  has_many :order_detail, dependent: :destroy
  
  belongs_to:genre
  
  def get_image
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
end
