class Post < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  has_many :comments, dependent: :destroy
end
