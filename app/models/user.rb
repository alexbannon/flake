class User < ActiveRecord::Base
  # TODO: validations
  has_secure_password
  has_many :attendances
  has_many :events, :through => :attendances
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end
