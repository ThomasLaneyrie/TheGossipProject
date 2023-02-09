class CreateJoinTablePrivateMessageUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :join_table_private_message_users do |t|
      t.belongs_to :sender, class_name: "User"
      t.belongs_to :recipient, class_name: "User"
      
      t.timestamps
    end
  end
end
