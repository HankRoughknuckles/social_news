require 'spec_helper'

describe Link do

  it "is invalid without a address" do
    expect(FactoryGirl.build(:link, address: nil)).not_to be_valid
  end

  describe "#vote_tally" do
    let!(:link) { FactoryGirl.create(:link) }

    context "with one upvote" do
      it "should return 1" do
        upvoter = FactoryGirl.create(:user)
        link.liked_by upvoter

        expect(link.vote_tally).to eq 1
      end
    end

    context "with one downvote" do
      it "should return -1" do
        downvoter = FactoryGirl.create(:user)
        link.disliked_by downvoter

        expect(link.vote_tally).to eq -1
      end
    end

    context "with one upvote and one downvote" do
      it "should return 0" do
        upvoter = FactoryGirl.create(:user)
        downvoter = FactoryGirl.create(:user)

        link.liked_by upvoter
        link.disliked_by downvoter

        expect(link.vote_tally).to eq 0
      end
    end
  end
end
