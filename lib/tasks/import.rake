require 'nokogiri'

namespace :chopped do
  task :import => :environment do
    doc = File.open('./tmp/choppedwiki.html')

    Importer.parse(doc)
  end
end
