# == Schema Information
#
# Table name: shows
#
#  id         :integer          not null, primary key
#  title      :text             not null
#  date       :date             not null
#  notes      :text
#  slug       :text             not null
#  series_num :string
#  season_num :integer
#  season_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_shows_on_slug  (slug) UNIQUE
#

class Show < ApplicationRecord
  include Slugger

  belongs_to :season
  has_and_belongs_to_many :judges
  has_many :contestants
  has_many :ingredients_shows
  has_many :ingredients, through: :ingredients_shows

  validates :title, :date, :series_num, :season_id, presence: true
end
