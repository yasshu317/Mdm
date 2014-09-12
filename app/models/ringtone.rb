class Ringtone < ActiveRecord::Base

  has_attached_file :source, 
    :path => ":rails_root/public/system/:attachment/:basename_:style.:extension",
	:url => "/system/:attachment/:basename_:style.:extension",
	:use_timestamp => false

  validates_attachment :source,
    :presence => true,
    :content_type => { :content_type => /^audio\/(mp3|mpeg)$/ }


end
