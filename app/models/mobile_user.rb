class MobileUser < ActiveRecord::Base
  belongs_to :group
  has_many :activity_logs
end
