class Link < ActiveRecord::Base
  acts_as_votable
  acts_as_commentable

  belongs_to :user

  validates_presence_of :address


  def vote_tally
    return self.get_upvotes.size - self.get_downvotes.size
  end
end
