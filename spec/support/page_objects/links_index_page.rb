class LinksIndexPage
  include Capybara::DSL

  def initialize
  end

  def has_title?(passed_title)
    page.title.downcase.match /#{passed_title.downcase}/
  end

  def has_an_add_link_button?
    add_link_button
  end

  def has_link_for?(link)
    links_list.has_css? "tr", text: link.link
  end


  private

  def add_link_button
    find 'a#add_link'
  end

  def links_list
    find '.links'
  end
end
