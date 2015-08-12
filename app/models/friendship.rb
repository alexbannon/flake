class Friendship < ActiveRecord::Base
  # this is great... only suggestion would be to look into validations to
  # ensure you can't friend the same user twice (e.g. validates :uniqueness with a :scope option)
  belongs_to :user
  belongs_to :friend, :class_name => "User"
end
