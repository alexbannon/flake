# again, whitespace between unrelated blocks of code
class User < ActiveRecord::Base
  # TODO: validations
  # awesome job with the self join for friendships...
  # this is often tricky to get right the first time, but you got it!
  has_many :friendships
  has_many :friends, :through => :friendships

  has_secure_password

  validates_uniqueness_of :email
  validates_uniqueness_of :username

  has_many :attendances, dependent: :destroy
  has_many :events, :through => :attendances
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end
