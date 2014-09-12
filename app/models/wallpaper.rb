class Wallpaper < ActiveRecord::Base

  has_attached_file :avatar, 
    :path => ":rails_root/public/system/:attachment/:id/:basename_:style.:extension",
	:url => "/system/:attachment/:id/:basename_:style.:extension",
  :use_timestamp => false,
	:styles => {
  		:thumb    => ['100x100#',  :jpg, :quality => 70],
  		:preview  => ['480x480#',  :jpg, :quality => 70],
  		:large    => ['600>',      :jpg, :quality => 70],
  		:retina   => ['1200>',     :jpg, :quality => 30]
	  }

  validates_attachment :avatar,
    :presence => true,
    :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/ }
end