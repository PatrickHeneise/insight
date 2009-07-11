class CreateTopicActivities < ActiveRecord::Migration
  def self.up
    create_table :topic_activities do |t|
      t.references :topic,								:null => false
      t.references :user,									:null => false
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :topic_activities
  end
end
