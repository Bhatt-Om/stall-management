class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :role, optional: true

  has_many :notification_tokens

  before_create :set_default_role, if: -> { role_id.nil? }

  def self.authenticate!(email, password)
    user = User.find_by(email: email)
    user&.valid_password?(password) ? user : nil
  end

  def customer?
    self&.role&.name == "customer"
  end

  def super_admin?
    self&.role&.name == "super_admin"
  end

  def stall_admin?
    self&.role&.name == "stall_admin"
  end

  private

  def set_default_role
    self.role_id = Role.find_by(name: "customer")&.id
  end
end
