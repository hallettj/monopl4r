class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.references :user
      t.string :name
      t.timestamps
    end
    add_index :accounts, :user_id, :unique => true
  end

  def self.down
    drop_table :accounts
  end
end
