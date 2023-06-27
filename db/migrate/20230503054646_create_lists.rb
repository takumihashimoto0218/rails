class CreateLists < ActiveRecord::Migration[7.0]
  def change
    create_table :lists do |t|
      t.string :title,     null: false
      t.bigint :board_id,  null: false
      t.timestamps
    end
  end
end
