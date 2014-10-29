require "spec_helper"


def posting_with_input(address)
end

describe LinksController do

  describe "POST #create" do
    let!(:user) { FactoryGirl.create(:user) }

    context "with an empty address" do
      before { sign_in user }

      cases = ["", nil]

      cases.each do |address|
        link_hash = FactoryGirl.attributes_for(:link, address: address)

        it "does not save the link when address is \"#{address}\"" do
          expect { 
            post :create, link: link_hash
          }.not_to change{user.links.count}
        end

        it "renders the new template when address is \"#{address}\"" do
          post :create, link: link_hash
          expect(response).to render_template :new
        end
      end
    end
  end
end
