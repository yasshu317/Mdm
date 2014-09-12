class EmailAccess < ActiveRecord::Base
	has_many :profile_email_accesses
    has_many :profiles, :through => :profile_email_accesses
end
