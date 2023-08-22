require 'rails_helper'

RSpec.describe ExpenseItem, type: :model do
  let(:user) { User.create(name: 'Sammed', email: 'sammed@test.com', password: '1234test') }
  let(:expense_item) { ExpenseItem.create(author: user, name: 'Ice cream', amount: 24) }
  let(:category) { Category.create(author: user, name: 'Food', icon: 'https://unsplash.com/photos/USAT3jVsYIc') }

  subject do
    ExpenseItemsCategory.create(expense_item:, category:)
  end

  context '#validation' do
    it 'should expense_item and category' do
      expect(subject).to be_valid
    end

    it 'should validate_presence_of(:expense_item)' do
      subject.expense_item = nil
      expect(subject).to_not be_valid
    end

    it 'should validate_presence_of(:amount)' do
      subject.category = nil
      expect(subject).to_not be_valid
    end
  end

  context '#association' do
    it 'should confirm expense_items_categories belong to expense_item' do
      expect(subject.expense_item).to eq(expense_item)
    end

    it 'should confirm expense_items_categories belong to catgory' do
      expect(subject.category).to eq(category)
    end
  end
end
