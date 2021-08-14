class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :cover, presence: true
  has_many :photos, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_one_attached :cover
end
