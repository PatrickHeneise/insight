class CreateSubscriptions < ActiveRecord::Migration
  def self.up
    create_table :subscriptions do |t|
      t.references :user,								:null => false
      t.references :forum,							:null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :subscriptions
  end
end
