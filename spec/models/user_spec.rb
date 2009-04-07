require File.dirname(__FILE__) + '/../spec_helper'

describe User, "accounting" do

  before :each do
    @user = User.create!(:login                 => 'hallett',
                         :email                 => 'hallettj@gmail.com',
                         :password              => 'wibble',
                         :password_confirmation => 'wibble')
  end
  
  it "should have an account" do
    @user.account.should_not be_nil
    @user.account.should be_a_kind_of(Account)
  end

  it "should create an account for the user if one does not already exist" do
    Account.find(:first, :conditions => { :user_id => @user.id }).should be_nil
    @user.account.should_not be_nil
    Account.find(:first, :conditions => { :user_id => @user.id }).should_not be_nil
  end

end
