# == Schema Information
#
# Table name: ingredients
#
#  id         :integer          not null, primary key
#  name       :text
#  appetizer  :boolean          default("false"), not null
#  dessert    :boolean          default("false"), not null
#  entree     :boolean          default("false"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ingredient < ApplicationRecord
  validates :name, presence: true

  has_many :ingredients_shows
  has_many :shows, through: :ingredients_shows


  def self.all_with_stats
    query = <<-EOL
      select i.*, count(ish.ingredient_id) as usage_count from ingredients i join ingredients_shows ish on ish.ingredient_id = i.id GROUP BY i.id ORDER BY usage_count desc
    EOL
    find_by_sql(query)
  end
end
