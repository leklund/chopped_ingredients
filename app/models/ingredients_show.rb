# == Schema Information
#
# Table name: ingredients_shows
#
#  ingredient_id :integer          not null
#  show_id       :integer          not null
#  round         :string
#
# Indexes
#
#  index_ingredients_shows_on_show_id_and_ingredient_id  (show_id,ingredient_id)
#

class IngredientsShow < ApplicationRecord
  belongs_to :ingredient
  belongs_to :show

  validates :round, presence: true
  validates :round, inclusion: { in: %w(appetizer entree dessert) }
end
