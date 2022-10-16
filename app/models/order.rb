class Order < ApplicationRecord
  has_many :order_details,dependent: :destroy
  belongs_to :customer

  validates:postal_code,presence:true
  validates:address,presence:true
  validates:name,presence:true

  enum payment_method:{credit_card:0,transfer:1}
  enum status:{deposit_wait:0,deposit:1,making:2,shipping_preparation:3,shipping:4}

end
