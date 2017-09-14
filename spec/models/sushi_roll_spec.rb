require 'rails_helper'

RSpec.describe SushiRoll, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:price)}
    it { should validate_presence_of(:roll_count)}
    it { should validate_presence_of(:spicy)}
    it { should validate_presence_of(:fish)}
    it { should validate_presence_of(:wrap)}
  end

  describe 'associations' do
    it { should belong_to(:user)}
  end

  describe '#had_too_much' do
    before(:each) do
      @user = FactoryGirl.create(:user)
      roll_1 = FactoryGirl.create(:sushi_roll, user: @user)
      roll_2 = FactoryGirl.create(:sushi_roll, user: @user)
      roll_3 = FactoryGirl.create(:sushi_roll, user: @user)
    end

    it "return false if user has had no more than 3 sushi rolls" do
      expect(@user.had_too_much).to eq(false)
    end

    it "return true if user has had more than 3 sushi rolls" do
      roll_4 = FactoryGirl.create(:sushi_roll, user: @user)
      expect(@user.had_too_much).to eq(true)
    end
  end

  describe '.by_price' do
    it "orders sushi rolls by price" do
      @user = FactoryGirl.create(:user)
      FactoryGirl.create(:sushi_roll, user: @user, price: 10)
      FactoryGirl.create(:sushi_roll, user: @user, price: 15)
      FactoryGirl.create(:sushi_roll, user: @user, price: 20)
      rolls = @user.sushi_rolls.by_price
      expect(rolls.first.price).to eq(10)
      expect(rolls[1].price).to eq(15)
      expect(rolls.last.price).to eq(20)
    end
  end


end
