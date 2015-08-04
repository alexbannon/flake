class Event < ActiveRecord::Base
  has_many :posts
  has_many :attendances
  has_many :users, through: :attendances
end
