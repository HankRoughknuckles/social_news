require "spec_helper"

describe LinksController do

  describe "POST #create" do
    context "with invalid attributes" do
      it "does not save the link" do
        expect { 
          post :create, link: FactoryGirl.attributes_for(:link, address: nil)
        }.not_to change{Link.count}
      end

      it "re-renders the :new template" do
        post :create, link: FactoryGirl.attributes_for(:link, address: nil)

        expect(response).to render_template :new
      end
    end
  end
end
