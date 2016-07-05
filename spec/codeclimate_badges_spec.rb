require 'code_climate_badges'
require 'spec_helper'

describe CodeClimateBadges, vcr: { :allow_unused_http_interactions => false } do

	context 'WebsiteOne', :vcr do
  	subject(:badges) { described_class.new 'github/AgileVentures/WebsiteOne' }

	  describe '#gpa_badge_url' do 
	    it { expect(badges.gpa_badge_url).to eq 'https://codeclimate.com/github/AgileVentures/WebsiteOne/badges/gpa.svg' }
	  end

    describe '#gpa', :vcr do
      it 'grabs gpa from the badge', :vcr do expect(badges.gpa).to eq '3.5' end
    end
	end
	context 'LocalSupport' do
		subject(:badges){described_class.new 'github/AgileVentures/LocalSupport'}
    describe '#gpa_badge_url' do 
      it { expect(badges.gpa_badge_url).to eq 'https://codeclimate.com/github/AgileVentures/LocalSupport/badges/gpa.svg' }
    end
    describe '#gpa' do
      it { expect(badges.gpa).to eq '3.2' }
    end
	end  

	context 'WSO with trailing slash' do
		subject(:badges) { described_class.new 'github/AgileVentures/WebsiteOne/' }
	  describe '#gpa_badge_url' do 
	    it { expect(badges.gpa_badge_url).to eq 'https://codeclimate.com/github/AgileVentures/WebsiteOne/badges/gpa.svg' }
	  end
	end
end