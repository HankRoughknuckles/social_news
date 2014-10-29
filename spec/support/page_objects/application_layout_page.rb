class ApplicationLayoutPage
  include Capybara::DSL

  def initialize
    @sign_in_link = "a#sign_in"
    @sign_up_link = "a#sign_up"
    @sign_out_link = "a#sign_out"

    @user_profile_link = "a#edit_user_profile"
  end
  
  def has_sign_in_link?
    has_css? @sign_in_link
  end
  
  def has_sign_up_link?
    has_css? @sign_up_link
  end
  
  def has_sign_out_link?
    has_css? @sign_out_link
  end

  def has_user_profile_link?
    has_css? @user_profile_link
  end
end
