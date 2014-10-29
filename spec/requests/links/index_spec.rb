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
    let!(:user_link) { FactoryGirl.create(:link, user: user) }

    before { ui.visit_page_as user }

    describe "the page" do
      it { expect(ui).to have_title "All Links" }
      it { expect(ui).to have_an_add_link_button }
    end

    describe "the logged in user's link" do
      it { expect(ui).to have_link_for user_link }
      it { expect(ui).to have_edit_button_for user_link }
      it { expect(ui).to have_delete_button_for user_link }
    end

    describe "the links of other users" do
      let!(:other) { FactoryGirl.create(:user) }
      let!(:non_user_link) { FactoryGirl.create(:link, user: other) }

      it { expect(ui).to have_link_for non_user_link }
      it { expect(ui).not_to have_edit_button_for non_user_link }
      it { expect(ui).not_to have_delete_button_for non_user_link }
    end
  end

  describe "a link entry" do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:user_link) { FactoryGirl.create(:link, user: user) }

    before do 
      user_link.liked_by(user)
      ui.visit_page_as(nil) 
    end

    it "should have the number of comments" do
      pending
    end

    it "should have the vote tally" do
      expect(page).to have_css(
        "#tally_#{user_link.id}", text: user_link.vote_tally)
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
