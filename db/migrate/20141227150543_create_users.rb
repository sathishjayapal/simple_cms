class CreateUsers < ActiveRecord::Migration
  def up
   
    create_table :users do |t|
    	t.column "first_name", :string,:limit => 25
    	t.string "last_name", :limit => 40
    	t.string "email", :default => "", :null => false
      t.timestamps
    end
    add_column("users","password", :string, :limit => 40, :after => "email")
  end
 say "****** adding admin_users"
  def down
  	drop_table :users
  end
end
