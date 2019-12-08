require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }

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
        user.name = nil;
        expect(user).to_not be_valid
      end

      it 'is not valid without surname' do
        user.surname = nil;
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
  end
end
