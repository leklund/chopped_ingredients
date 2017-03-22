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

class ContestantsShow < ApplicationRecord
  belongs_to :contestant
  belongs_to :show

  validates :contestant_id, :show_id, :placing, presence: true
  validates :placing, inclusion: { in: [1, 2, 3, 4] }
end
