class Idea < ActiveRecord::Base
  validates :description, presence: {message: "can't be blank!"}
end
