class LinksShowPage
  include Capybara::DSL

  def initialize
    @delete_button_for_link = "#delete_link"
  end

  def has_delete_button_for_link?
    has_css? @delete_button_for_link
  end
end
