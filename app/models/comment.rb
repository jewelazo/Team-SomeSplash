class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true

  # after_create :photos_comments_count
  # def photos_comments_count
  #   self.photos.comments_count += 1
  #   self.photos.save
  # end
end
# after_create do |_song|
#   album = Album.find(album_id)
#   album.duration += duration
#   album.save
# end
# def increment_comments_count
# self.photo.comments_count +=1
# self.photo.save
# after_create do
#   photo = Photo.find(photo_id)
#   photo.comments_count +=1
#   photo.save
# end
