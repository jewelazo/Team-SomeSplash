class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true

  # after_create do |_comment|
  #   photo = Photo.find(commentable_id)
  #   photo.comments_count += 1 if commentable_type == 'Photo'
  #   photo.save
  # end

  # after_destroy do |_comment|
  #   photo = Photo.find(commentable_id)
  #   photo.comments_count -= 1 if commentable_type == 'Photo'
  #   photo.save
  # end
end
