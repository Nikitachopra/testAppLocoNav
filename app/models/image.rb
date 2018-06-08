class Image < ApplicationRecord

	mount_uploader :avatar, AvatarUploader
	attr_accessor :tag_list, :image
	acts_as_taggable_on :tags
	
	belongs_to :user
end
