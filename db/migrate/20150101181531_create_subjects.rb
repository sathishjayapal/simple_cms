class CreateSubjects < ActiveRecord::Migration
  def up
    create_table :subjects do |t|
	t.string "name", :null => false, :limit => 35
  	t.integer "position", :null => false
  	t.boolean "visible", :default => false
  	t.timestamps
    end
  end
  def down
  	drop_table :subjects
  end
end
