require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it 'check password and password confirmation are equal' do
      user = User.create(first_name: "kobe", last_name: "bryant", email: 'kb@.gmail.com', password: "test", password_confirmation: 'test')
      expect(user).to be_valid
    end

    it 'fail if user saves without password confirmation' do
      user = User.create(first_name: "kobe", last_name: "bryant", email: 'kb@.gmail.com', password: "test", password_confirmation: nil)
      expect(user).to_not be_valid
    end

    it 'fail if user does not add first name' do
      user = User.create(first_name: nil, last_name: "bryant", email: 'kb@.gmail.com', password: "test", password_confirmation: 'nil')
      expect(user).to_not be_valid
    end

    it 'fail if user does not add last name' do
      user = User.create(first_name: "kobe", last_name: nil, email: 'kb@.gmail.com', password: "test", password_confirmation: 'nil')
      expect(user).to_not be_valid
    end
  end

  describe ".authenticate_with_credentials" do
    it 'should login with valid user' do
      user = User.create(
        last_name: "bryant",
        first_name: "kobe",
        email: "abc@abc.com",
        password: "test",
        password_confirmation: "test"
        )
        userA = User.authenticate_with_credentials(user.email, user.password)
      expect(userA.id).to be user.id
    end
  end
  
  
end
