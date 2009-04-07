class Journal < ActiveRecord::Base
  has_many :postings

  named_scope(:owned_by, lambda { |u|
    { :include => { :postings => { :account => :user } },
      :conditions => ["users.id = ?", u.id] }
  })

  protected

    def validate
      if postings.length < 1
        errors.add(:postings, "must be present.")
      elsif postings.inject(0.0) { |s, p| s + p.amount } != 0.0
        errors.add(:postings, "amounts must sum to zero.")
      end
    end

end
