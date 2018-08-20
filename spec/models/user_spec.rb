require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(first_name: 'First', last_name: 'Last', email: 'first@last.com', password: 'abc123', password_confirmation: 'abc123') }

  describe 'Validations' do
    it 'should be valid when all values are present' do
      expect(subject.valid?).to be true
    end
    it 'should not be valid when password and password confirmation are different' do
      subject.password_confirmation = '123abd'
      expect(subject.valid?).to be false
    end
    it 'should not be valid when password is missing' do
      subject.password = nil
      expect(subject.valid?).to be false
    end
    it 'should not be valid when password confirmation is missing' do
      subject.password_confirmation = nil
      expect(subject.valid?).to be false
    end
    it 'should not be valid when password is less than 6 characters' do
      subject.password = 'abc1'
      subject.password_confirmation = 'abc1'
      expect(subject.valid?).to be false
    end
    it 'should not be valid when first name is missing' do
      subject.first_name = nil
      expect(subject.valid?).to be false
    end
    it 'should not be valid when last name is missing' do
      subject.last_name = nil
      expect(subject.valid?).to be false
    end
    it 'should not be valid when email is missing' do
      subject.email = nil
      expect(subject.valid?).to be false
    end
    it 'should not be valid when email is already in DB' do
      other_user_in_db = User.create(first_name: 'First', last_name: 'Last', email: 'first@last.com', password: 'abc123', password_confirmation: 'abc123')
      expect(subject.valid?).to be false
    end

  end
end
