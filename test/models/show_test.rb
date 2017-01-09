# == Schema Information
#
# Table name: shows
#
#  id         :integer          not null, primary key
#  title      :text
#  date       :date
#  notes      :text
#  series_num :string
#  season_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ShowTest < ActiveSupport::TestCase
  describe 'validations' do
    it 'has required fields' do
      show = described_class.new
      show.valid?.must_equal false
      show.errors[:title].wont_be_empty 'no validation error for title present'
      show.errors[:date].wont_be_empty 'no validation error for date present'
      show.errors[:series_num].wont_be_empty 'no validation error for series_num present'
      show.errors[:season_id].wont_be_empty 'no validation error for season_id'
    end
  end
end
