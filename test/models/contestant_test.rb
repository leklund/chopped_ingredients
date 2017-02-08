# == Schema Information
#
# Table name: contestants
#
#  id         :integer          not null, primary key
#  name       :text             not null
#  slug       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_contestants_on_slug  (slug) UNIQUE
#

require 'test_helper'

class ContestantTest < ActiveSupport::TestCase
  describe 'validations' do
    it 'has required fields' do
      subject = described_class.new
      subject.valid?.must_equal false
      subject.errors[:name].wont_be_empty 'no validation error for name present'
    end
  end
end
