require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }

  describe 'CRUD operations at unit level' do 
    context 'happy path' do

      before do
        user.save!
      end

      it 'creates a user record with valid fields' do
        p user.inspect()
        expect(user.id).to be_truthy
      end
    end
  end
end
