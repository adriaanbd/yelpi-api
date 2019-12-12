require 'rails_helper'

RSpec.describe V1::UsersController, :type => :request do
  let(:tommy) { create(:user, email: 'tom@gmail.com') }
  # To be transferred later on in the specs/support directory
  def user_params(attributes_hash)
    { user: attributes_hash }
  end

  def create_user(attributes)
    post user_route,
      params: user_params(attributes)
  end

  def valid_user_attributes
    attributes_for(:user)
  end

  def invalid_user_attributes
    attributes_for(:user, given_name: nil)
  end

  def user_route(username = nil)
    "/v1/users/#{username}"
  end

  def json_response
    JSON.parse(response.body)
  end

  def user_token
    JSON.parse(response.body)['token']
  end
  # End of methods to be transferred to support directory

  # Spec for creating user
  describe 'POST /v1/users' do
    context 'valid params' do
      it 'creates and logs in a user' do
        expect { create_user(valid_user_attributes) }
          .to change(User, :count).by(1)

        expect(response).to have_http_status(201)
        
        expect(json_response['token']).to eq(user_token)
      end
    end

    context 'invalid params' do
      context 'missing given_name' do
        it 'does not create user' do
          expect { create_user(invalid_user_attributes)}
            .to_not change(User, :count)

          expect(response).to have_http_status(422)
          expect(json_response['message']).to match('Cannot create user')
          expect(json_response['errors']['given_name']).to include("can't be blank")
        end
      end

      context 'duplicate email' do
        it 'does not create user' do
          create_user(valid_user_attributes.merge(email: tommy.email))
          expect(response).to have_http_status(422)
          expect(json_response['errors']['email']).to include('has already been taken')
        end
      end
    end
  end
end