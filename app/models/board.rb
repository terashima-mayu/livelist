class Board < ApplicationRecord
  belongs_to :user
  
  has_many :setlists, dependent: :destroy
  has_many :goods, dependent: :destroy

  validates :date_and_time, :artist, :venue, :name, :doors_open_time, :show_start_time, presence: true
end