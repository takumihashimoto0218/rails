class CreateBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :boards do |t|
      t.string :title,        null: false
      t.string :body,        null: false
      t.boolean :status
      t.integer :user_id

      t.timestamps
    end
  end
end
