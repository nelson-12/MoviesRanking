require 'rails_helper'

RSpec.describe 'POST /login', type: :request do
    let(:url) { '/login' }
    let(:user) { create(:user) }
    let(:params) do
        {
            user: {
                email: user.email,
                password: user.password
            }
        }
    end

    context 'when params are correct' do
        before do
          post url, params: params
        end
    
        it 'returns 302 and redirect' do
          expect(response).to have_http_status(302)
          expect(response).to redirect_to('/')
        end
    end

    context 'when login params are incorrect' do
        before { post url }
        
        it 'returns unathorized status' do
          expect(response.status).to eq 200
        end
      end
end

RSpec.describe 'DELETE /logout', type: :request do
    let(:url) { '/logout' }
  
    it 'returns 302, no content' do
      delete url
      expect(response).to have_http_status(302)
    end
  end