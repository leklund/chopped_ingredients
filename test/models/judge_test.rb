# == Schema Information
#
# Table name: judges
#
#  id         :integer          not null, primary key
#  name       :text             not null
#  slug       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_judges_on_slug  (slug) UNIQUE
#

require 'test_helper'

class JudgeTest < ActiveSupport::TestCase
  describe 'validations' do
    it 'has required fields' do
      judge = described_class.new
      judge.valid?.must_equal false
      judge.errors[:name].wont_be_empty 'no validation error for name present'
    end
  end
end
