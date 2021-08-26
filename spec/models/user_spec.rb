require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user1 = User.new(:first_name => "Helen", :last_name => "Queue", :email => 'abc@email.com', :password => "123456", :password_confirmation => "123456")    
    @user1.save!
  end
  
  describe '#create' do

    it 'returns true if password is correct but confirmation does not match' do
      user2 = User.new(:first_name => "Kelly", :last_name => "Hue", :email => 'cde@email.com', :password => "123")
      user2.password_confirmation = ""
      user2.valid?
      expect(user2.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'returns true if password is empty' do
      user2 = User.new(:first_name => "Kelly", :last_name => "Hue", :email => 'cde@email.com', :password => nil)
      user2.valid?
      expect(user2.errors.full_messages).to include("Password can't be blank")
    end

    it 'returns true if email is not unique (email is not case sensitive)' do
      # TEST@TEST.com should not be allowed if test@test.COM is in the database)'
      user2 = User.new(:first_name => "Kelly", :last_name => "Hue", :email => 'abc@email.com', :password => "123456")
      user2.password_confirmation = "123456"
      user2.valid?
      # puts user2.valid?
      # puts "errors.full_messages: " + user2.errors.full_messages.to_s
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end

    it "returns true if email already exists in the database" do
      user2 = User.new(:first_name => "Kelly", :last_name => "Hue", :email => 'abc@email.com', :password => "123456")
      user2.password_confirmation = "123456"
      user2.valid?
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end
    
    it "returns true if email is blank" do
      user2 = User.new(:first_name => "Kelly", :last_name => "Hue", :email => nil, :password => "123456")
      user2.password_confirmation = "123456"
      user2.valid?
      expect(user2.errors.full_messages).to include("Email can't be blank")
    end
    
    it "returns true if firstname is blank" do
      user2 = User.new(:first_name => nil, :last_name => "Hue", :email => 'cde@email.com', :password => "123456")
      user2.password_confirmation = "123456"
      user2.valid?
      expect(user2.errors.full_messages).to include("First name can't be blank")
    end
    
    it "returns true if last name is blank" do
      user2 = User.new(:first_name => "Amy", :last_name => nil, :email => 'cde@email.com', :password => "123456")
      user2.password_confirmation = "123456"
      user2.valid?
      expect(user2.errors.full_messages).to include("Last name can't be blank")
    end
    
    it 'returns true if password is less than 6 characters' do
      user2 = User.new(:first_name => "Kelly", :last_name => "Hue", :email => 'cde@email.com', :password => "123")
      user2.password_confirmation = "123"
      user2.valid?
      expect(user2.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

  end

  describe '.authenticate_with_credentials' do

    # examples for this class method here
    user2 = User.new(:first_name => "Kelly", :last_name => "Hue", :email => 'abc@email.com', :password => "123456")
    user2.save

    it 'returns true if authenticated with credentials 1' do
      expect(User.authenticate_with_credentials(@user1.email, @user1.password).email).to eq(@user1.email)
    end
    
    # puts "user2.email: " + user2.email
    it 'returns true if authenticated with credentials 2' do
      expect(User.authenticate_with_credentials(user2.email, user2.password).email).to eq(user2.email)
    end
  
  end

end

