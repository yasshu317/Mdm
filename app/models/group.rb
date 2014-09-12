class Group < ActiveRecord::Base
  belongs_to :profile
  has_many :mobile_users
end
