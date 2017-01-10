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
end
