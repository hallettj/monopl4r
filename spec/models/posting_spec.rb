require File.dirname(__FILE__) + '/../spec_helper'

describe Posting, "validations" do

  before :each do
    @account = mock_model(Account)
    @journal = mock_model(Journal)
    @asset_type = mock_model(AssetType)
    @posting = Posting.new
  end

  it "should default to amount of zero" do
    @posting.amount.should == 0.0
  end

  it "should require an amount" do
    @posting.amount = nil
    @posting.should_not be_valid
    @posting.should have(1).error_on(:amount)
  end

  it "should require the amount to be a number" do
    @posting.amount = :foo
    @posting.should have(1).error_on(:amount)
  end

  it "should require an account" do
    @posting.should_not be_valid
    @posting.should have(1).error_on(:account_id)
  end

  it "should not require a journal" do
    @posting.should have(:no).errors_on(:journal_id)
  end

  it "should require an asset type" do
    @posting.should_not be_valid
    @posting.should have(1).error_on(:asset_type_id)
  end

  it "should be valid only with an amount, an account, and an asset type" do
    @posting.amount = 13.00
    @posting.account = @account
    @posting.journal = @journal
    @posting.asset_type = @asset_type
  end

end
