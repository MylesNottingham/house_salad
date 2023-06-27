require "rails_helper"

feature "user can search for house members" do

  scenario "user submits valid state name" do
    # As a user
    # When I visit "/"
    visit "/"

    # And I select "Colorado" from the dropdown
    select "Colorado", from: :state

    # And I click on "Locate Members from the House" button
    click_on "Locate Members of the House"

    # Then my path should be "/search" with "state=CO" in the parameters
    expect(current_path).to eq(search_path)

    # And I should see a message "8 Results"
    expect(page).to have_content("8 Results")

    # And I should see a list of 8 the members of the house for Colorado
    expect(page).to have_css(".member", count: 8)

    # And I should see a name, role, party, and district for each member
    within(first(".member")) do
      expect(page).to have_css(".name")
      expect(page).to have_css(".role")
      expect(page).to have_css(".party")
      expect(page).to have_css(".district")
    end
  end
end
