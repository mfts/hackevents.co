require 'spec_helper'

describe "Uploading Hackathons" do
  it "requires login" do
    visit '/hackathons'
    expect(page).to_not have_content("Hackathons Importer")
  end

end
