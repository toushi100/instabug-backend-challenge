class CreateChatsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :chats do |t|
      t.references :application, null: false, foreign_key: true
      t.integer :messages_count, default: 0, null: false
      t.integer :number, null: false, default: 0

      t.timestamps
    end
  end
end
