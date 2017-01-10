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

require 'test_helper'

class IngredientsShowTest < ActiveSupport::TestCase
  describe 'validations' do
    it 'has required fields' do
      subject = described_class.new
      subject.valid?.must_equal false
      subject.errors[:round].wont_be_empty 'no validation error for round present'
      subject.errors[:ingredient].wont_be_empty 'no validation ingredient for name present'
      subject.errors[:show].wont_be_empty 'no validation error for show present'
    end

    it 'validates round' do
      ingredient = Ingredient.first
      show = Show.first
      subject = described_class.new(ingredient: ingredient, show: show, round: 'cocktails')
      subject.valid?.must_equal false
      subject.errors[:round].wont_be_empty 'no validation error for round present'

      subject.round = 'appetizer'
      subject.valid?.must_equal true
    end
  end
end
