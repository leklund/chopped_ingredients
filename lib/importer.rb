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

  def parse_contestants(chefs)
    chefs.reverse.map.with_index do |chef, i|
      m = chef.match(/([-[:alpha:]\s'"’.]+),*\s*(.*?)\((?:eliminated.*?|winner\))/)

      return {} if m.nil?

      {
        name: m[1],
        slug: slugify(m[1]),
        description: m[2],
        placing: i + 1,
      }
    end
  end

  def parse_episode(chunk)
    data = {
      series_num: chunk[0].elements[0].text,
      season_num: chunk[0].elements[1].text,
      show_name:  chunk[0].elements[2].text.gsub(/^"|"$/, ''),
      airdate:    chunk[0].elements[3].text,
    }

    data[:ingredients] = parse_ingredients(chunk[1].elements[0].css('li').map(&:text))
    data[:judges] = chunk[1].elements[1].css('li').map(&:text)
    data[:contestants] = parse_contestants(chunk[2].css('li').map(&:text))
    data[:notes] = chunk[2].elements[0].elements.find{|e| e.text.match?(/notes/i) }&.text&.gsub(/^Episode notes: /, '')

    data
  end

  def parse_ingredients(ingredients)
    courses = {
      appetizer: 'Appetizer',
      entree: 'Entrée',
      dessert: 'Dessert',
    }

    ingredients.map!{ |e| e.split(/,\s*/) }

    courses.each_with_object({}) do |(key, course), data|
      foods = ingredients.select{|x| x.any?{|i| i.match?(course)}}.flatten
      foods[0].gsub!(/#{course}: */, '')

      data[key] = foods
    end
  end

  def parse_table(table)
    header = table.previous_element.text.gsub(/\s*\[edit\]/, '')
    return unless header.match?(/(Season \d+|Specials)/)

    setup_season(header)

    rows = table.css('tr').to_a
    rows.shift

    # grab an episode and do some magic
    rows.each_slice(3) do |episode_rows|
      episode_data = parse_episode(episode_rows)


      show = Show.find_or_create_by(season: @season, series_num: episode_data[:series_num], season_num: episode_data[:season_num])

      # update if we need to
      show.title = episode_data[:show_name]
      show.slug = slugify("#{show.series_num}-#{show.title}")
      show.date = episode_data[:airdate]
      show.notes = episode_data[:notes]

      puts "#{show.title} - #{show.date}"

      # move on to the next episode if there are no ingredients
      next if episode_data[:ingredients].values.flatten.all?{ |i| i.empty? || i == 'N/A' }

      ### judges
      judges = episode_data[:judges].map do |judge|
                 next if judge.empty? || judge == 'N/A'
                 Judge.find_by(slug: slugify(judge)) || Judge.create(name: judge, slug: slugify(judge))
               end
      judges.compact!

      show.judges = judges if judges.present? && show.judges.empty?
      show.save

      ### ingredients
      episode_data[:ingredients].each do |course, ingredients|
        next unless ingredients.present?

        ingredients.each do |i|
          next if i.empty? || i == 'N/A'
          ingredient = Ingredient.find_by(slug: slugify(i)) || Ingredient.create(name: i, slug: slugify(i))
          ingredient.update_attribute(course, true)
          IngredientsShow.find_or_create_by(ingredient_id: ingredient.id, show_id: show.id, round: course)
        end
      end

      ### contestants
      episode_data[:contestants].each{ |c| c[:show_id] = show.id}

      episode_data[:contestants].each do |c|
        contestant = Contestant.find_by(slug: c[:slug])

        unless contestant
          contestant = Contestant.create(name: c[:name], slug: c[:slug])
        end

        ContestantsShows.find_or_create_by(contestant_id: contestant.id, show_id: show.id, description: c[:description], placing: c[:placing])
      end
    end
  end

  def setup_season(header)
    number = header.scan(/\s+(\d+)\s+/).flatten.first
    @season = Season.find_or_create_by(name: header, slug: slugify(header), number: number)
  end

  def slugify(txt)
    txt.parameterize(separator: '_')
  end
end
