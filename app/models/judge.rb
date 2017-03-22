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

  def self.all_by_appearances
    query = <<-EOL
      SELECT j.*, count(s.judge_id) as appearances
      FROM judges j
      JOIN judges_shows s ON (s.judge_id = j.id)
      GROUP BY j.id ORDER BY appearances desc
    EOL

    find_by_sql query
  end
end
