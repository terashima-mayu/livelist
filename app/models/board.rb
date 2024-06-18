class Board < ApplicationRecord
  belongs_to :user
  has_many :setlists, dependent: :destroy
  has_many :goods, dependent: :destroy

  validates :date_and_time, :artist, :venue, :name, presence: true
end