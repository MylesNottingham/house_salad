require "rails_helper"

RSpec.describe SearchFacade do
  let (:facade) { SearchFacade.new("CO") }
  it "exists" do
    expect(facade).to be_a SearchFacade
  end

  it "returns members" do
    expect(facade.members.count).to eq(8)
    expect(facade.members.first).to be_a Member
  end
end
