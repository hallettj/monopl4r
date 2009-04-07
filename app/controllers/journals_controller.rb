class JournalsController < ApplicationController

  def index
    @journals = Journal.owned_by(current_user)
  end

  def new
    @journal = Journal.new(:label => "Electronic Fun(d)s Transfer")
  end

  def create
    @journal = Journal.new(params[:journal])
    @postings = params[:postings].map { |p|
      Journal.postings.build(p)
    }.reject { |p| p.amount <= 0.0 }.map { |p|
      [p, Journal.postings.build(p.merge(:amount => -p.amount, :account => current_user.account))]
    }.flatten
    if @journal.save
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end

end
