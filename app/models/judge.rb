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

class Judge < ApplicationRecord
  include Slugger

  has_and_belongs_to_many :shows

  validates :name, presence: true
end
