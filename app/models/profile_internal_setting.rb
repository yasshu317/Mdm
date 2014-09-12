class ProfileInternalSetting < ActiveRecord::Base
	belongs_to :profile
	belongs_to :internal_setting
end
