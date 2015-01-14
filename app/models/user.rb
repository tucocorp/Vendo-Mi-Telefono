class User < ActiveRecord::Base
  attr_accessor :login

  devise  :database_authenticatable, :registerable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable
  
  

  has_many :members
  has_many :sucursals, through: :members
  #
  # Associations
  #

  # has_many :project_members

  #
  # Validations
  #

  # validates :username, presence: true
  # validates :username, uniqueness: { case_sensitive: false }

  #
  # Scopes
  #

  scope :locked      , -> { where('users.locked_at IS NOT NULL') }
  scope :enabled     , -> { where('users.locked_at IS NULL') }

  #
  # Callbacks
  #

  # after_create :generate_access_token

  #
  # Class methods
  #

  # def self.find_first_by_auth_conditions(warden_conditions)
  #   conditions = warden_conditions.dup
  #   if login = conditions.delete(:login)
  #     where(conditions).where(["lower(username) = :value OR lower(email) = :value", { value: login.downcase }]).first
  #   else
  #     where(conditions).first
  #   end
  # end

  #
  # Instance methods
  #

  def full_name
    return username if name.nil? and last_name.nil?
    "#{name.capitalize} #{last_name}"
  end

  def locked?
    (locked_at != nil)
  end

  def generate_access_token
    token = loop do
      random_token = Base64.encode64(SecureRandom.uuid)
      break random_token unless self.class.exists?(access_token: random_token)
    end

    update_column(:access_token, token)
  end
end
