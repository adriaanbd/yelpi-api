require 'rails_helper'

RSpec.describe V1::UsersController, :type => :request do
  let(:user) { attributes_for(:user) }
  let(:db_user) { create(:user) }

  describe 'GET - Show User' do
    skip
    context 'when the user exists' do 
      it 'returns the user' do 
      end 

      it 'returns a success response' do
      end
    end

    context 'when the user does not exist' do 
      it 'does not returns a user' do 
      end 

      it 'returns a response of no success' do 
      end
    end
  end


  describe 'POST - Create User' do 

    context 'with valid params' do
      it 'creates user' do 
        expect {
          post '/v1/users', :params => { user: user }.to 
          change(User, :count).by(1)
        }
      end

      it 'returns a success response' do 
        expect {
          post '/v1/users', :params => { user: user }.to 
          be_succesful
        }
      end

      it 'returns the user' do
        post '/v1/users', :params => { user: user }
        returned_user = JSON.parse(response.body)['user']
        expect(returned_user['email']).to eq(user[:email])
      end
    end

    context 'with invalid params' do

      before(:each) do 
        user[:given_name] = nil
      end

      it 'does not create a user' do
        expect {
          post '/v1/users', :params => { user: user }.to_not 
          change(User, :count)
        }
      end

      it 'returns a not succesful response' do
        expect {
          post '/v1/users', :params => { user: user }.to_not 
          be_succesful
        }
      end
    end
  end

  describe 'PATCH update' do
    skip
  end

  describe 'DELETE destroy' do
    skip
  end
end