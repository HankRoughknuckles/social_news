require 'spec_helper'

describe "Links#index" do
  let!(:ui) { LinksIndexPage.new }
  let!(:page_path) { links_path }

  before do
    visit page_path
  end

  context "while logged out" do
    it "should not have an add link button" do
      expect(ui).not_to have_an_add_link_button
    end
  end

  context "while logged in" do
    let!(:user) { FactoryGirl.create(:user) }
    before do 
      login_as user 
      visit page_path
    end

    describe "page content" do
      it "should be proper" do
        other =           FactoryGirl.create(:user)
        user_link =       FactoryGirl.create(:link, user: user)
        non_user_link =   FactoryGirl.create(:link, user: other)

        visit page_path

        expect(ui).to have_title "All Links"
        expect(ui).to have_an_add_link_button

        #links
        expect(ui).to have_link_for user_link
        expect(ui).to have_link_for non_user_link

        #edit/delete for own links
        expect(ui).to have_edit_button_for user_link
        expect(ui).to have_delete_button_for user_link

        #should not have edit/delete for others' links
        expect(ui).not_to have_edit_button_for non_user_link
        expect(ui).not_to have_delete_button_for non_user_link
      end
    end

    describe "adding a link" do
      it "should work" do
        new_link = FactoryGirl.build(:link, user: user)

        ui.create_link new_link

        expect(ui).to have_title "All Links"
        expect(ui).to have_link_for new_link
      end
    end
  end
end
