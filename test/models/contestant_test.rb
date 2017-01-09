# == Schema Information
#
# Table name: contestants
#
#  id          :integer          not null, primary key
#  name        :text
#  description :text
#  show_id     :integer
#  placing     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ContestantTest < ActiveSupport::TestCase
  describe 'validations' do
    it 'has required fields' do
      subject = described_class.new
      subject.valid?.must_equal false
      subject.errors[:name].wont_be_empty 'no validation error for name present'
      subject.errors[:placing].wont_be_empty 'no validation placing for name present'
      subject.errors[:show].wont_be_empty 'no validation error for show present'
    end

    it 'validates placing' do
      show = Show.first
      subject = described_class.new(show: show, name: 'Arthur', placing: 42)
      subject.valid?.must_equal false
      subject.errors[:placing].wont_be_empty 'no validation error for placing present'

      subject.placing = 4
      subject.valid?.must_equal true
    end
  end
end
