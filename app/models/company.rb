class Company < ActiveRecord::Base
  has_many :sucursals, dependent: :destroy

  validates :name, presence: true
  validates :contact_phone, presence: true
  validates :contact_phone, length: { is: 8 }
end

