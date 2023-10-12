class CreateTaskFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :task_favorites do |t|
      t.bigint :user_id,  null: false
      t.bigint :task_id, null: false
      t.timestamps
    end
  end
end
