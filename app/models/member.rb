class Member < ActiveRecord::Base
  enum role: [ :collaborator, :admin ]

  belongs_to :sucursal
  belongs_to :user, dependent: :destroy

  delegate :full_name, :name, to: :user
  has_many :buys
end
