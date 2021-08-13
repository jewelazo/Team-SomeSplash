class Photo < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  belongs_to :category
  has_many :comments, as: :commentable, dependent: :destroy
end
