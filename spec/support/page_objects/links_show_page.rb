class LinksShowPage
  include Capybara::DSL

  def initialize
    @delete_button_for_link = "#delete_link"
    @edit_button_for_link = "#edit_link"
    @upvote_button = "#upvote"
    @downvote_button = "#downvote"
  end

  def has_edit_button_for_link?
    has_css? @edit_button_for_link
  end

  def has_delete_button_for_link?
    has_css? @delete_button_for_link
  end

  def has_upvote_button?
    has_css? @upvote_button
  end

  def has_downvote_button?
    has_css? @downvote_button
  end
end
