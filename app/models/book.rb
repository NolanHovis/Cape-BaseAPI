class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :genre, presence: true
  validates :coverImagePath, presence: true
  belongs_to :user
end
