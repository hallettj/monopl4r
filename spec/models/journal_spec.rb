require File.dirname(__FILE__) + '/../spec_helper'

describe Journal, "validations" do

  before :each do
    @account = mock_model(Account)
    @asset_type = mock_model(AssetType)
    @journal = Journal.new
  end

  it "should require postings" do
    @journal.postings.length.should == 0
    @journal.should_not be_valid
    @journal.should have(1).error_on(:postings)
  end

  it "should require that posting amounts sum to zero" do
    a = @journal.postings.build(:amount => 3.00, :account => @account, :asset_type => @asset_type)
    b = @journal.postings.build(:amount => 3.00, :account => @account, :asset_type => @asset_type)
    @journal.should_not be_valid
    @journal.should have(1).error_on(:postings)
    b.amount = -3.00
    @journal.should have(:no).errors_on(:postings)
  end

  it "should save all postings when the journal is saved" do
    a = @journal.postings.build(:amount => 3.00, :account => @account, :asset_type => @asset_type)
    b = @journal.postings.build(:amount => -3.00, :account => @account, :asset_type => @asset_type)
    a.should be_a_new_record
    b.should be_a_new_record
    @journal.save!
    a.should_not be_a_new_record
    b.should_not be_a_new_record
  end

end
