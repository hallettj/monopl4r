class AssetType < ActiveRecord::Base
  validates_length_of :identifier, :minimum => 1
  validates_uniqueness_of :identifier
end
