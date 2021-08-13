class Photo < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  belongs_to :category, counter_cache: true
  has_many :comments, as: :commentable, dependent: :destroy
end
