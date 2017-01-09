# == Schema Information
#
# Table name: ingredients
#
#  id         :integer          not null, primary key
#  name       :text
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
end
