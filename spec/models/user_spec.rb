require 'spec_helper'

describe User do
  
  before { @user = User.new(email: 'hello@mapc.org', password: 'thisIsANiceLongSecurePassword') }

  subject { @user }

  it { should be_valid }

  describe "when email does not contain MAPC" do
    it "should be invalid" do 

      addresses = %w[ cloydster@gmail.com someone@yahoo.net example.user+ri@hotmail.com ]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end
    end
  end

  describe "when email contains MAPC" do
    it "should be valid" do 

      addresses = %w[ mgardnerer@mapc.org hlstclair@mapc.org tomreardon@mapc.org ]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid
      end
    end
  end

end