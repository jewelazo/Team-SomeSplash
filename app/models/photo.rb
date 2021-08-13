class Photo < ApplicationRecord
  belongs_to :category
  validates :title, presence: true, uniqueness: true
end
