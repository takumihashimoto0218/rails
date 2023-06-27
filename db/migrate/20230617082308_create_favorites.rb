class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.bigint :user_id,  null: false
      t.bigint :board_id, null: false
      t.timestamps
    end
    add_index :favorites, [:user_id, :board_id], unique: true
  end
end
