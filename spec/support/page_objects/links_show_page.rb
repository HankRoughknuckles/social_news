class LinksShowPage
  include Capybara::DSL

  def initialize(page_path)
    @page_path = page_path #the path to the current page

    @delete_button_for_link = "#delete_link"
    @edit_button_for_link = "#edit_link"
    @upvote_button = "#upvote"
    @downvote_button = "#downvote"
  end

  def visit_page
    visit @page_path
  end

  def visit_page_as(user)
    login_as(user)
    visit @page_path
  end

  def has_edit_button_for_link?
    has_css? @edit_button_for_link
  end

  def has_delete_button_for_link?
    has_css? @delete_button_for_link
  end

  #vote buttons
  def has_upvote_button_for?(link)
    has_css? "#{@upvote_button}-#{link.id}"
  end

  def has_downvote_button_for?(link)
    has_css? "#{@downvote_button}-#{link.id}"
  end

  def click_upvote_button_for(link)
    page.find(:css, "#{@upvote_button}-#{link.id}").click
  end

  def click_downvote_button_for(link)
    page.find(:css, "#{@downvote_button}-#{link.id}").click
  end
end
