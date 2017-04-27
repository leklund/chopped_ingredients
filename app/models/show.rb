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
  has_many :contestants_shows
  has_many :contestants, through: :contestants_shows
  has_many :ingredients_shows
  has_many :ingredients, through: :ingredients_shows

  validates :title, :date, :series_num, :season_id, presence: true

  def self.for_ingredient(ingredient_id)
    query = <<-EOL
      SELECT s.*, ish.round
      FROM shows s
      JOIN ingredients_shows ish ON ish.show_id = s.id
      WHERE ish.ingredient_id = ?
      ORDER BY date
    EOL

    find_by_sql [query, ingredient_id]
  end

  def all_ingredients
    ingredients_shows.select('*').joins(:ingredient)
  end

  def all_contestants
    contestants_shows.select('*').joins(:contestant).order(:placing)
  end
end
