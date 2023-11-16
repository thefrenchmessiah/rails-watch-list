class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :movie

  validates :comment, presence: true, length: { minimum: 6 }
  validates :movie_id, :list_id, presence: true
  validates :movie_id, uniqueness: { scope: :list_id }
end
