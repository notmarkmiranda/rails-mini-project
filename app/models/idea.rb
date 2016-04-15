class Idea < ActiveRecord::Base
  belongs_to :category
  validates :description, presence: {message: "can't be blank!"}
end
