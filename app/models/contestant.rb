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

class Contestant < ApplicationRecord
  include Slugger
  validates :name, :slug, presence: true
end
