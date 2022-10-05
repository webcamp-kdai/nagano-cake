class CartItem < ApplicationRecord
  has_one_attached:image
  belongs_to :customer
  belongs_to :item
  
  def sub_total
    item.add_tax_price * amount
  end
  
end
