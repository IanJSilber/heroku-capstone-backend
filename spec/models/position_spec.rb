require 'rails_helper'

RSpec.describe Position, type: :model do
  let(:user) {
    User.new(:email => "ian@example.com", :password => "password")
  }
  subject { described_class.new(
    symbol: "BTC",
    amount: 2000,
    user_id: 1)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without user_id" do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without symbol" do
    subject.symbol = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without amount" do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  # Testing associations
  describe "Associations" do
    it { should belong_to(:user).without_validating_presence }
  end

end
