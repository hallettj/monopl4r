class PostingsController < ApplicationController

  def index
    @postings = Posting.find(:all, :include => [:journal, :asset_type])
  end

  def new
    @journal = Journal.new
    @posting = @journal.postings.build
  end

  def create
    @journal = Journal.new(:label => "Electronic Fun(d)s Transfer")
    if BigDecimal(params[:posting][:amount]) > 0.0
      credit = @journal.postings.build(params[:posting])
      debit  = @journal.postings.build(params[:posting].merge(:amount => -credit.amount, :account => current_user.account))
    end
    if @journal.save
      redirect_to :action => 'index'
    else
      @posting = @journal.postings.build(params[:posting])
      render :action => 'new'
    end
  end

end
