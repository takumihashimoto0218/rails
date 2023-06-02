class CreatePackdetails < ActiveRecord::Migration[7.0]
  def change
    create_table :packdetails do |t|
      t.bigint :topic_id, null: false
      t.bigint :pack_id, null: false
      t.timestamps
    end
  end
end
