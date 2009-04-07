class Account < ActiveRecord::Base
  belongs_to :user
  has_many :postings
  has_many :journals, :through => :postings

  validates_presence_of :user_id
  validates_uniqueness_of :user_id

  def name
    user.login
  end
end
