class CreateMessagesTable < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.references :chat, null: false, foreign_key: true
      t.integer :number, null: false, default: 0
      t.string :body
      t.timestamps
    end
  end
end
