class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment

  belongs_to :commentable, :polymorphic => true

  default_scope -> { order('created_at ASC') }

  #It's possible to vote on comments
  # acts_as_voteable

  # NOTE: Comments belong to a user
  belongs_to :user
end
