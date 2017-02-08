# == Schema Information
#
# Table name: ingredients
#
#  id         :integer          not null, primary key
#  name       :text             not null
#  slug       :text             not null
#  appetizer  :boolean          default("false"), not null
#  dessert    :boolean          default("false"), not null
#  entree     :boolean          default("false"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_ingredients_on_slug  (slug) UNIQUE
#

class Ingredient < ApplicationRecord
  include Slugger

  validates :name, presence: true

  has_many :ingredients_shows
  has_many :shows, through: :ingredients_shows


  def self.all_with_stats
    query = <<-EOL
      SELECT i.*, count(ish.ingredient_id) as usage_count
      FROM ingredients i
        JOIN ingredients_shows ish ON ish.ingredient_id = i.id
      GROUP BY i.id
      ORDER BY usage_count desc, i.slug
    EOL
    find_by_sql(query)
  end
end
