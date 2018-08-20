require 'rails_helper'

RSpec.describe Product, type: :model do
  category = Category.new(name: 'Test Category')
  subject { Product.new(name: 'Any name', price: 12.34, quantity: 123, category: category) }

  describe 'Validations' do
    it 'should be valid when all values are present' do
      expect(subject.valid?).to be true
      # expect(subject.errors).to be_empty
    end
    it 'should not be valid without a name' do
      subject.name = nil
      expect(subject.valid?).to be false
    end
    it 'should not be valid without a price' do
      subject.price_cents = nil
      expect(subject.valid?).to be false
    end
    it 'should not be valid without a quantity' do
      subject.quantity = nil
      expect(subject.valid?).to be false
    end
    it 'should not be valid without a category' do
      subject.category = nil
      expect(subject.valid?).to be false
    end

  end
end
