class CreateTheses < ActiveRecord::Migration
  def self.up
    create_table :theses do |t|
      t.references :editor,								:null => false
      t.references :coeditor
      t.string :topic,										:limit => 255, :null => false
      t.references :supervisor,						:null => false
      t.references :assistant_supervisor,	:null => false
      t.date :delivery,										:null => false
      t.string :state
      t.text :abstract

      t.timestamps
    end
  end

  def self.down
    drop_table :theses
  end
end
