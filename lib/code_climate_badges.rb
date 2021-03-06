require 'httparty'

class CodeClimateBadges
  def initialize identifier
    @identifier = identifier
  end

  def gpa_badge_url
    @identifier.gsub!(/\/$/, '')
    "https://codeclimate.com/#{@identifier}/badges/gpa.svg"
  end

  def gpa
    response = HTTParty.get(gpa_badge_url)
    stat_regex = /fill-opacity=".3">.*?fill-opacity=".3">([^<]+)/
    response.body =~ stat_regex ? $1 : nil
  end
end