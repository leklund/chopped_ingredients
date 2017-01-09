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

class Contestant < ApplicationRecord
  belongs_to :show

  validates :name, :show_id, :placing, presence: true
  validates :placing, inclusion: { in: [1, 2, 3, 4] }
end
