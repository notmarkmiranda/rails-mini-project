class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: {message: "can't be blank!"}
  validates :email, presence: {message: "can't be blank!"}, uniqueness: true
  validates :password, presence: {message: "can't be blank!"}

  enum role: %w(default admin)
end
