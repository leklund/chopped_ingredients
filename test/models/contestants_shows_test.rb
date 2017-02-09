# == Schema Information
#
# Table name: contestants_shows
#
#  contestant_id :integer          not null
#  show_id       :integer          not null
#  description   :string
#  placing       :integer
#
# Indexes
#
#  index_contestants_shows_on_show_id_and_contestant_id  (show_id,contestant_id)
#

require 'test_helper'

class ContestantsShowsTest < ActiveSupport::TestCase
  describe 'validations' do
    it 'validates placing' do
      contestant = Contestant.first
      show = Show.first

      subject = described_class.new(show: show, contestant: contestant, placing: 42)
      subject.valid?.must_equal false
      subject.errors[:placing].wont_be_empty 'no validation error for placing present'

      subject.placing = 4
      subject.valid?.must_equal true
    end
  end
end
