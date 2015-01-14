class State < ActiveRecord::Base
  has_many :buy_details
  validates :factor, numericality: true

end
