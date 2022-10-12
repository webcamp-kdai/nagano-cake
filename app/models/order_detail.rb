class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum maiking_status:{impossible:0,waiting:1,maiking:2,complete:3}
  
  def sub_total
    item.add_tax_price * amount
  end

end
