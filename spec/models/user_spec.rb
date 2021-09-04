require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#transfer' do
    let (:user_1) { create(:user, balance: 10) }
    let (:user_2) { create(:user) }

    it 'normal' do
      user_1.transfer(10, user_2)
      expect(user_1.balance).to eq(0)
      expect(user_2.balance).to eq(10)
    end

    it 'transfers to self' do
      expect{user_1.transfer(10, user_1)}.to raise_error(InvalidTarget)
    end

    pending 'transfer negative'
    pending 'transfer'
  end
end
