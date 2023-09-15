class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title,            null: false
      t.string :body,             null: false
      t.integer :diffculty_level
      t.boolean :is_solo
      t.bigint :list_id,  null: false
      t.integer :position
      t.timestamps
    end
  end
end
