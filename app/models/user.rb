class User < ActiveRecord::Base
  # TODO: validations
  has_secure_password
  validates_uniqueness_of :email
  validates_uniqueness_of :username
  has_many :attendances
  has_many :events, :through => :attendances
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end
