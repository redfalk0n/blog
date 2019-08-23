class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false, default: ""
      t.string :author, null: false, default: ""
      t.string :content, null: false, default: ""
      t.integer :edition
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
  end
end
