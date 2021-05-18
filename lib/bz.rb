require "bz/version"

module Bz
  class Error < StandardError; end
  require 'yaml'
  SINGLES = YAML.load_file('lib/bz_single.yml')

  def release_year(song)
    SINGLES.select{|i| i["title"].eql?(song)}.first["year"]
  end

  def self.all_titles
    SINGLES.map{ |i| i["title"] }
  end

  def this_year_songs(year)
    SINGLES.group_by { |i| i["year"] }[year]
  end
end
