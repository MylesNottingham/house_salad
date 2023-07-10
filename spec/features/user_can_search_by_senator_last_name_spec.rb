require 'rails_helper'

RSpec.describe 'Senator Search' do
  describe 'happy path', :vcr do
    # before :each do
    #   json_response = File.read("spec/fixtures/members_of_the_senate.json")

    #   stub_request(:get, "https://api.propublica.org/congress/v1/118/senate/members.json").
    #   to_return(status: 200, body: json_response)
    # end

    it 'allows user to search for a Senator by last name' do
      visit root_path

      fill_in :search, with: 'Sanders'
      click_button 'Search'

      expect(page.status_code).to eq 200
      expect(page).to have_content("Senator Bernard Sanders was found!")
      expect(page).to have_content("SenSanders")
    end

    it 'allows user to search for another Senator by last name' do
      visit root_path

      fill_in :search, with: 'Booker'
      click_button 'Search'

      expect(page.status_code).to eq 200
      expect(page).to have_content("Senator Cory Booker was found!")
      expect(page).to have_content("SenBooker")
    end
  end
end