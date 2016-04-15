class Category < ActiveRecord::Base
  has_many :ideas
  validates :name, presence: {message: "can't be blank!"}
end
