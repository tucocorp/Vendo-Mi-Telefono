class Sucursal < ActiveRecord::Base
  belongs_to :company
  
  has_many  :members, dependent: :destroy
  has_many  :users, through: :members, source: :user
end