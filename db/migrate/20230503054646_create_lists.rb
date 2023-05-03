class CreateLists < ActiveRecord::Migration[7.0]
  def change
    create_table :lists do |t|
      t.bigint :task_id,  null: false
      t.string :title,     null: false

      t.timestamps
    end
  end
end
