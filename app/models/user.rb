class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :full_name, presence: true

  has_one_attached :photo

  def self.ransackable_attributes(auth_object = nil)
    %w[created_at email encrypted_password full_name id remember_created_at reset_password_sent_at reset_password_token role updated_at]
  end
end
