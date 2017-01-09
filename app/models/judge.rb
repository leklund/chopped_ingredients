# == Schema Information
#
# Table name: judges
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Judge < ApplicationRecord
  has_and_belongs_to_many :shows

  validates :name, presence: true
end
