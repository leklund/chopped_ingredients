# == Schema Information
#
# Table name: seasons
#
#  id         :integer          not null, primary key
#  name       :text             not null
#  slug       :text             not null
#  number     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_seasons_on_slug  (slug) UNIQUE
#

class Season < ApplicationRecord
  include Slugger
end
