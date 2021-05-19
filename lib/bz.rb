require "bz/version"

module Bz
  require 'yaml'
  SINGLES = YAML.load_file(File.join(__dir__, 'bz_single.yml'))
  
  class Error < StandardError; end

  def self.release_year(song)
    SINGLES.select{|i| i["title"].eql?(song)}.first["year"]
  end

  def self.all_titles
    SINGLES.map{ |i| i["title"] }
  end

  def self.this_year_songs(year)
    SINGLES.group_by { |i| i["year"] }[year]
  end
  
  def self.live_gym
    puts "B'zのLIVE-GYMにようこそ～"
  end
end
