class Coupon < ActiveRecord::Base
  enum status: [:pending , :printed] 
  belongs_to :buy

end
