class CreateBulletActivities < ActiveRecord::Migration
  def self.up
    create_table :bullet_activities do |t|
      t.references :bullet,								:null => false
      t.references :user,									:null => false
      t.string :state

      t.timestamps
    end
		add_index :bullet_activities, :bullet_id
		add_index :bullet_activities, :user_id
		add_index :bullet_activities, :state
  end

  def self.down
    drop_table :bullet_activities
  end
end
