class Link < ActiveRecord::Base
  acts_as_votable
  acts_as_commentable

  belongs_to :user

  validates_presence_of :title
  validates_presence_of :address
  validates_presence_of :user


  def vote_tally
    return self.get_upvotes.size - self.get_downvotes.size
  end

  def upvoted_by?(user)
    return nil if user.nil?

    if user.voted_as_when_voted_for(self) == true
      return true
    end
      return false
  end

  def downvoted_by?(user)
    return nil if user.nil?

    if user.voted_as_when_voted_for(self) == false
      return true
    end
      return false
  end
end
