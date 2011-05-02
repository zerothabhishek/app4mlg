class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :first_name
      t.string :last_name
      t.text :address
      t.string :phone_number
      t.string :email
      t.boolean :verified, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
