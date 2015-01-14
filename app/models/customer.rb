class Customer < ActiveRecord::Base
  has_many :buys
  validates :rut, presence: true
  validates :rut, format: {:with => /\A(\d{1,3})(\d{1,3})(\d{1,3})\-(k|\d{1})\Z/i, message: "el rut %{value} ingresado no es valido."}
  validates :name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :email, presence: true
  validates_format_of :email, :with => Devise.email_regexp
  validates :phone, presence: true
  validates :phone, length: { is: 8 }


  def full_name
    # primer_apellido = last_name.split(' ').first
    # segundo_apellido = last_name.split(' ').last
    # "#{name.capitalize} #{primer_apellido.capitalize} #{segundo_apellido.capitalize}"
    "#{name.capitalize} #{last_name}"
  end

end
