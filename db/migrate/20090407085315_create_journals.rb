class CreateJournals < ActiveRecord::Migration
  def self.up
    create_table :journals do |t|
      t.integer :batch_id, :null => false, :default => 0
      t.string :label
      t.timestamps
    end
  end

  def self.down
    drop_table :journals
  end
end
