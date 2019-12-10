require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }
  let(:saved_user) { FactoryBot.create(:user) }

  describe 'CRUD operations at unit level' do 
    context 'happy path' do

      before do
        user.save!
      end

      it 'creates a user record with valid fields' do
        expect(user.id).to be_truthy
      end
    end

    context 'validations' do
      it 'is not valid without name' do
        user.given_name = nil;
        expect(user).to_not be_valid
      end

      it 'is not valid without last_name' do
        user.last_name = nil;
        expect(user).to_not be_valid
      end

      it 'is not valid without email' do 
        user.email = nil;
        expect(user).to_not be_valid
      end

      it 'is not valid without password' do 
        user.password = nil;
        expect(user).to_not be_valid
      end

      it 'is not valid without password' do 
        user.password_confirmation = 'test';
        expect(user).to_not be_valid
      end
    end

    context 'update' do

      before do 
        saved_user.given_name = 'john'
        saved_user.last_name = 'doe'
        saved_user.email = 'johndoe@example.com'
        saved_user.password = 'test012'
        saved_user.save!
      end

      it 'updates name' do
        name = saved_user.given_name + ' ' + saved_user.last_name
        expect(name).to eq('john doe')
      end

      it 'updates email' do
        expect(saved_user.email).to eq('johndoe@example.com')
      end

      it 'updates password' do
        expect(saved_user.password).to eq('test012')
      end
    end

    context 'delete' do
      it 'deletes a record' do 
        saved_user.destroy
        expect { saved_user.reload }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end
end
