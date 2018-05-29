class CreateUserMeta < ActiveRecord::Migration[5.1]
  def change
    create_table :user_meta do |t|
      t.integer :user_id
      t.string :meta_keys
      t.string :meta_values

      t.timestamps
    end
  end
end
