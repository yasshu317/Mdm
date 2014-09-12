class InternalSetting < ActiveRecord::Base
	has_many :profile_internal_settings
    has_many :profiles, :through => :profile_internal_settings
end
