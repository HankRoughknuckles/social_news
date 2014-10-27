require 'spec_helper'

describe "Links#index" do
  let!(:ui) { LinksIndexPage.new }
  let!(:page_path) { links_path }

  before do
    visit page_path
  end

  describe "page content" do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:other) { FactoryGirl.create(:user) }
    let!(:user_link) { FactoryGirl.create(:link, user: user) }
    let!(:non_user_link) { FactoryGirl.create(:link, user: other) }

    before do
      login_as(user)
      visit page_path
    end

    it "should be present" do
      expect(ui).to have_title "Social News"
      expect(ui).to have_an_add_link_button
      expect(ui).to have_link_for user_link
    end
  end
end
