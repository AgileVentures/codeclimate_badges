class CodeClimateBadges
  def initialize identifier
  	@identifier = identifier
  end

  def gpa_badge_url
  	@identifier.gsub!(/\/$/, '')
    "https://codeclimate.com/#{@identifier}/badges/gpa.svg"
  end
end