require "spec_helper"

describe 'layouts/application' do

  it "should display a sign in form when signed out" do
    render

    expect(rendered).to have_css "input[value='submit']"
  end


  it "should display a signout button when signed in" do
    user = FactoryGirl.create(:user)
    sign_in user

    render 

    expect(rendered).to have_css "a", text: "Sign out"
  end
end
