module ApplicationHelper
  @@upvote_icon_classes = "vote_icon grey glyphicon glyphicon-chevron-up"
  @@downvote_icon_classes = "vote_icon grey glyphicon glyphicon-chevron-down"

  def upvote_icon_for(link)
    classes = @@upvote_icon_classes
    classes += " selected" if link.upvoted_by?(current_user)

    return content_tag(:span, nil, class: classes)
  end


  def downvote_icon_for(link)
    classes = @@downvote_icon_classes
    classes += " selected" if link.downvoted_by?(current_user)

    return content_tag(:span, nil, class: classes)
  end
end
