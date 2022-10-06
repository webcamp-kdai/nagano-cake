class Order < ApplicationRecord
  
  enum payment_method:{credit_card:0,transfer:1}
  enum status:{deposit_wait:0,deposit:1,making:3}
  
end
