class LinksShowPage
  include Capybara::DSL

  def initialize(page_path)
    @page_path = page_path #the path to the current page

    @delete_button_for_link = "#delete_link"
    @edit_button_for_link = "#edit_link"

    @comment_form =             ".new_comment"
    @comment_input =            "#{@comment_form} input[type=text]"
    @submit_comment_button =    "#{@comment_form} input[type=submit]"
    @comment_author_name =      ".author"
  end

  def upvote_button_for(link)
    return "#upvote_#{link.id}"
  end

  def downvote_button_for(link)
    return "#downvote_#{link.id}"
  end

  def tally_for(link)
    return "#tally_#{link.id}"
  end


  def visit_page
    visit @page_path
  end

  def visit_page_as(user)
    user.present? ? login_as(user) : logout
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
    has_css? upvote_button_for(link)
  end

  def has_downvote_button_for?(link)
    has_css?downvote_button_for(link)
  end

  def click_upvote_button_for(link)
    page.find(:css, upvote_button_for(link) ).click
  end

  def click_downvote_button_for(link)
    page.find(:css, downvote_button_for(link) ).click
  end

  def has_tally_for?(link)
    has_css? tally_for(link), text: link.vote_tally
  end


  #comment stuff
  def has_comment_form?
    has_css? @comment_form
  end

  def create_comment(text = "blahblah")
    find( @comment_input ).set text
    page.find( @submit_comment_button ).click
  end

  def has_comment_author_name?
    has_css? @comment_author_name
  end
end
