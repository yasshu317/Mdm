class ProfileEmailAccess < ActiveRecord::Base
	belongs_to :profile
	belongs_to :email_access
end
