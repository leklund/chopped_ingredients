require 'nokogiri'

namespace :chopped do
  desc 'Import chopped ingredients'
  task :import => :environment do
    doc = File.open('./tmp/choppedwiki.html')

    Importer.parse(doc)
  end
end
