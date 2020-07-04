require 'rails_helper'

RSpec.describe WelcomeController, :type => :controller do

    context "GET #index" do
        it "should success and render to index" do
            get :index
            expect(response).to have_http_status(200)
        end

        it "should request not empty" do
            get :index
            expect(assigns(:summary)).to_not be_empty
        end
    end

end