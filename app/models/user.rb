class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: {message: "can't be blank!"}
  validates :email, presence: {message: "can't be blank!"}
  validates :password, presence: {message: "can't be blank!"}
end
