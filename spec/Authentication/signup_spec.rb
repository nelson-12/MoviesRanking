require 'rails_helper'

RSpec.describe 'POST /register', type: :request do
    let(:url){ '/register' }
    let(:params) do
        {
          user: {
            email: 'user@example.com',
            password: 'password'
          }
        }
      end


    context 'when user is unauthenticated' do
        before { post url, params: params }
    
        it 'returns 200' do
          expect(response.status).to eq 302
        end
    end

    
end