class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    drop_table :messages
    create_table :messages do |t|
      t.string :receiver
      t.text :text
      t.references :user, foreign_key: true

      t.timestamps
    end

    add_index :messages, [:user_id, :created_at]
  end
end