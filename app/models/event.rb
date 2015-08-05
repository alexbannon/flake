class Event < ActiveRecord::Base
  has_many :posts
  has_many :attendances, dependent: :destroy
  has_many :users, through: :attendances
end
