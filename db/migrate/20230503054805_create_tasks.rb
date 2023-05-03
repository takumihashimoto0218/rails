class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title,            null: false
      t.string :body,             null: false
      t.integer :diffculty_level, null: false
      t.boolean :is_solo,         null: false

      t.timestamps
    end
  end
end
