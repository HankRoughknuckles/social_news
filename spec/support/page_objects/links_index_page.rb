class LinksIndexPage
  include Capybara::DSL

  def initialize
    @add_link_button = "a#add_link"
    @links_list = ".links"
  end

  def has_title?(passed_title)
    page.title.downcase.match /#{passed_title.downcase}/
  end

  def has_an_add_link_button?
    has_css? @add_link_button
  end

  def has_link_for?(link)
    has_css? "#{@links_list} a", text: link.address
  end

  def has_edit_button_for?(link)
    has_css? "#{@links_list} #edit-#{link.id}"
  end

  def has_delete_button_for?(link)
    has_css? "#{@links_list} #delete-#{link.id}"
  end

  def click_add_link_button
    find( @add_link_button ).click
  end

  def click_save_button
    page.find(:css, "input[type=submit]").click
  end

  def create_link(link)
    click_add_link_button

    fill_in 'link_address', with: link.address
    fill_in 'link_description', with: link.description

    click_save_button
  end
end
