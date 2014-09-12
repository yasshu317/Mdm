class Profile < ActiveRecord::Base
    belongs_to :ringtone
    belongs_to :wallpaper

    has_many :profile_internal_settings
    has_many :internal_settings, :through => :profile_internal_settings

    has_many :profile_email_accesses
    has_many :email_accesses, :through => :profile_email_accesses

end
