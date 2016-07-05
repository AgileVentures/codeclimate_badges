require 'code_climate_badges'

describe CodeClimateBadges do
  subject(:badges) { described_class.new 'github/AgileVentures/WebsiteOne' }
  describe '#gpa_badge_url' do 
    it { expect(badges.gpa_badge_url).to eq 'https://codeclimate.com/github/AgileVentures/WebsiteOne/badges/gpa.svg' }
  end
end