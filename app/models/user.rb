class User < ActiveRecord::Base
  acts_as_token_authenticatable

  has_many :albums
  has_many :pictures, through: :albums
  has_many :videos, through: :albums

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
