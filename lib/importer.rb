require 'nokogiri'

class Importer
  attr_reader :doc

  def self.parse(doc)
    importer = self.new(doc)

    importer.import_ingredients
  end

  def initialize(html)
    @doc = Nokogiri::HTML(html)
  end

  def import_ingredients
    doc.css('table').each do |table|
      parse_table table
    end
  end

  private

  attr_reader :season, :show

  def parse_table(table)
    header = table.previous_element.text.gsub(/\s*\[edit\]/, '')
    return unless header.match?(/(Season \d+|Specials)/)

    setup_season(header)

    rows = table.css('tr').to_a
    rows.shift

    #row_enum = rows.each

    rows.each_slice(3) do |ep_rows|
      meta = ep_rows[0]
      ingredients = ep_rows[1]
      judges = ep_rows[2]

      series_num = meta.elements[0].text
      season_num = meta.elements[1].text
      show_name  = meta.elements[2].text
      airdate    = meta.elements[3].text
      puts "#{series_num} - #{season_num} - #{show_name} - #{airdate}"

      show = Show.find_or_create_by(season: @season, series_num: series_num, season_num: season_num)

      # update if we need to
      show.title = show_name
      show.date = airdate
      #show.notes = '' #TODO
      show.save

    end
  end

  def setup_season(header)
    number = header.scan(/\s+(\d+)\s+/).flatten.first
    @season = Season.find_or_create_by(name: header, number: number)
  end
end
