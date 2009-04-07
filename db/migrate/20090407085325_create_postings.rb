class CreatePostings < ActiveRecord::Migration
  def self.up
    create_table :postings do |t|
      t.references :account, :journal, :asset_type
      t.decimal :amount, :null => false, :default => 0.0
      t.timestamps
    end
  end

  def self.down
    drop_table :postings
  end
end
