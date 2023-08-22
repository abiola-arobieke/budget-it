require 'rails_helper'

RSpec.describe ExpenseItem, type: :model do
  let(:user) { User.create(name: 'Sammed', email: 'sammed@test.com', password: '1234test') }

  subject do
    ExpenseItem.create(author: user, name: 'Ice cream', amount: 24)
  end

  context '#validation' do
    it 'should accept user, name, and amount' do
      expect(subject).to be_valid
    end

    it 'should validate_presence_of(:name)' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should validate_presence_of(:amount)' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end

    it 'should validate_presence_of(:author)' do
      subject.author = nil
      expect(subject).to_not be_valid
    end
  end

  context '#association' do
    it 'should confirm category belong to an author' do
      expect(subject.author).to eq(user)
    end

    it 'should confirm author name' do
      expect(subject.author.name).to eq('Sammed')
    end
  end
end
