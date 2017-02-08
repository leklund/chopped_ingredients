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

require 'test_helper'

class IngredientTest < ActiveSupport::TestCase
  describe 'validations' do
    it 'has required fields' do
      ingredient = described_class.new
      ingredient.valid?.must_equal false
      ingredient.errors[:name].wont_be_empty 'no validation error for name present'
    end
  end

  describe '.all_with_stats' do
    before do
      IngredientsShow.create(ingredient: Ingredient.first, show: Show.first, round: 'appetizer')
      IngredientsShow.create(ingredient: Ingredient.last, show: Show.first, round: 'appetizer')
    end

    it 'returns the ingredients with a count of usage' do
      res = Ingredient.all_with_stats

      assert res.first.usage_count
    end

    it 'returns the ingredients ordered by usage count' do
      res = Ingredient.all_with_stats

      counts = res.map(&:usage_count)

      assert_equal counts, counts.sort.reverse
    end

    it 'includes the course that the ingredient was used for' do

    end
  end
end
