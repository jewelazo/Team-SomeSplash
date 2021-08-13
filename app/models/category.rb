class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :photos, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
end
