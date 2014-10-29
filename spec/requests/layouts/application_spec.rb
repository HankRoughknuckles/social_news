require "spec_helper"

describe "application layout" do
  let!(:ui) { ApplicationLayoutPage.new }
  let!(:page_path) { links_path }


  context "when not logged in" do
    before { visit page_path }
    it { expect(ui).to have_sign_in_link }
    it { expect(ui).to have_sign_up_link }
  end


  context "when logged in" do
    let!(:user) { FactoryGirl.create(:user) }

    before do 
      login_as(user) 
      visit page_path
    end

    it { expect(ui).to have_user_profile_link }
    it { expect(ui).to have_sign_out_link }
  end
end
