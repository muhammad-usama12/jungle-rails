require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    
    it "saves user when all fields entered" do
      @user = User.new(
        first_name: "Test",
        last_name: "Case",
        email: "test@test.com",
        password: "test123",
        password_confirmation: "test123"
      )
      @user.save
      expect(@user).to be_valid
    end
    it "validates password and password_confirmation, values dont match" do
      @user = User.new(
        first_name: "Test",
        last_name: "Case",
        email: "test@test.com",
        password: "test12",
        password_confirmation:"!test12"
      )  
      @user.validate
      expect(@user).to be_invalid
    end
    
    it "email address must be unique to each user" do
      @user = User.new(
        first_name: "Test",
        last_name: "Case",
        email: "TEST@TEST.COM",
        password: "test123",
        password_confirmation:"test123"
      )  
      @user.save
      @user2 = User.new(
        first_name: "Test",
        last_name: "Case",
        email: "test@test.com",
        password: "test123",
        password_confirmation:"test123"
      )  
      @user2.validate
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end
    it "validates first name, last name, and email" do
      @user = User.new(
        first_name: nil,
        last_name: nil,
        email: nil,
        password: "test123",
        password_confirmation:"test123"
      )  
      @user.validate
      expect(@user.errors.full_messages).to include("First name can't be blank", "Last name can't be blank", "Email can't be blank")
    end
    it "validates password length, minimum 6 character length" do
      @user = User.new(
        first_name: "Test",
        last_name: "Case",
        email: "test@test.com",
        password: "test1",
        password_confirmation:"test1"
      )  
      @user.validate
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)", "Password confirmation is too short (minimum is 6 characters)")
    end
  end

  describe '.authenticate_with_credentials' do

    it "user login successful, password matches" do
    @user = User.new(
      first_name: "Test",
      last_name: "Case",
      email: "test@test.com",
      password: "test123",
      password_confirmation:"test123"
    )  
    @user.save
    user = User.authenticate_with_credentials("test@test.com","test123")
    expect(user).to_not be_nil
  end
    it "user login successful, email matches" do
    @user = User.new(
      first_name: "Test",
      last_name: "Case",
      email: "test@test.com",
      password: "test123",
      password_confirmation:"test123"
    )  
    @user.save
    user = User.authenticate_with_credentials("test@test.com","test123")
    expect(user).to_not be_nil
  end
    it "user login unsuccessful, email doesn't match" do
    @user = User.new(
      first_name: "Test",
      last_name: "Case",
      email: "test@test.com",
      password: "test123",
      password_confirmation:"test123"
    )  
    @user.save
    user = User.authenticate_with_credentials("testcase@test.com","test123")
    expect(user).to be_nil
  end
    it "user login unsuccessful, password doesn't match" do
    @user = User.new(
      first_name: "Test",
      last_name: "Case",
      email: "test@test.com",
      password: "test123",
      password_confirmation:"test123"
    )  
    @user.save
    user = User.authenticate_with_credentials("test@test.com","test12")
    expect(user).to be_nil
  end
    it "checks for trailing whitespace in email address" do
    @user = User.new(
      first_name: "Test",
      last_name: "Case",
      email: "test@test.com",
      password: "test123",
      password_confirmation:"test123"
    )  
    @user.save
    user = User.authenticate_with_credentials(" test@test.com ","test123")
    expect(user).to_not be_nil
  end
    it "checks for case sensitivity for email address" do
    @user = User.new(
      first_name: "Test",
      last_name: "Case",
      email: "test@test.com",
      password: "test123",
      password_confirmation:"test123"
    )  
    @user.save
    user = User.authenticate_with_credentials("test@TEST.com","test123")
    expect(user).to_not be_nil
  end

end


end



