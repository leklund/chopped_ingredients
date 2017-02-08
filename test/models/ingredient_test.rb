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
