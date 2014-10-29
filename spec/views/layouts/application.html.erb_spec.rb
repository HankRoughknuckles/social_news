require "spec_helper"

describe 'layouts/application' do
  context "with a signed in user" do

    it "should display a signout button" do
      user = FactoryGirl.create(:user)
      sign_in user

      render 

      expect(rendered).to have_content "Sign out"
    end
  end
end
