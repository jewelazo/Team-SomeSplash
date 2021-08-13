class Category < ApplicationRecord
  has_many :photos, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
