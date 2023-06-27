class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :name, null: false
      t.bigint :user_id, null: false
      t.string :self_introduction
      t.timestamps
    end
  end
end
