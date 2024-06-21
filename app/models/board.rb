class Board < ApplicationRecord
  belongs_to :user

  validates :date_and_time, :artist, :venue, :name, :doors_open_time, :show_start_time, presence: true

  mount_uploader :image, ImageUploader
end