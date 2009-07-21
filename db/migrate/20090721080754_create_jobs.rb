class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.references :company
      t.references :user
      t.string :title
      t.text :description
      t.text :prerequisit
      t.string :period
      t.integer :payment
      t.date :timeout

      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
