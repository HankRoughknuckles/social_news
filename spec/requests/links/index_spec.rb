require 'spec_helper'

describe "Links#index" do
  let!(:page_path) { links_path }
  let!(:ui) { LinksIndexPage.new(links_path) }


  it "should not have an add link button while logged out" do
    ui.visit_page_as(nil)

    expect(ui).not_to have_an_add_link_button
  end


  context "while logged in" do
    let!(:user) { FactoryGirl.create(:user) }

    before { ui.visit_page_as user }

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
  end

  it "should let the user add links" do
    user = FactoryGirl.create(:user)
    new_link = FactoryGirl.build(:link, user: user)

    ui.visit_page_as(user)
    ui.create_link new_link

    expect(ui).to have_link_for new_link
  end

  it "should let the user upvote links" do
    user = FactoryGirl.create(:user)
    link = FactoryGirl.create(:link, user: user)

    ui.visit_page_as(user)

    expect{ ui.click_upvote_button_for(link) }.to(
      change { link.get_upvotes.size }.by(1))
  end

  it "should let the user downvote links" do
    user = FactoryGirl.create(:user)
    link = FactoryGirl.create(:link, user: user)

    ui.visit_page_as(user)

    expect{ ui.click_downvote_button_for(link) }.to(
      change { link.get_downvotes.size }.by(1))
  end
end
