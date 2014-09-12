module ProfilesHelper

  def get_internal_settings(profile)
	if !profile.blank?
	  profile.internal_settings.map(&:name).join(',')
	end
  end

  def get_email_access(profile)
	if !profile.blank?
	  profile.email_accesses.map(&:mail_server).join(',')
	end
  end

end
