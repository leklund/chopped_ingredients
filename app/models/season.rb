# == Schema Information
#
# Table name: seasons
#
#  id         :integer          not null, primary key
#  name       :text
#  number     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Season < ApplicationRecord
end
