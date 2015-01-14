class Model < ActiveRecord::Base
  belongs_to :trademark
  has_many :buy_details

  validates :name, presence: true
  validates :price, presence: true

  #
  #Methods
  #

end
