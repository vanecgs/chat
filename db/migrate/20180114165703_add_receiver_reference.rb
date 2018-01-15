class AddReceiverReference < ActiveRecord::Migration[5.1]
  def change
    change_table :messages do |t|
      t.references :receiver, foreign_key: true
    end
  end
end
