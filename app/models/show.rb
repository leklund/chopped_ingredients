# == Schema Information
#
# Table name: shows
#
#  id         :integer          not null, primary key
#  title      :text
#  date       :date
#  notes      :text
#  series_num :string
#  season_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Show < ApplicationRecord
  belongs_to :season
  has_and_belongs_to_many :judges
  has_many :contestants
  has_many :ingredients, through: :ingredients_shows

  validates :title, :date, :series_num, :season_id, presence: true
end
