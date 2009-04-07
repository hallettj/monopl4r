class Posting < ActiveRecord::Base
  belongs_to :account
  belongs_to :journal
  belongs_to :asset_type

  validates_presence_of :account_id, :asset_type_id
  validates_numericality_of :amount

  def pretty_amount
    "%s%0.2f" % [asset_type.identifier, amount]
  end
end
