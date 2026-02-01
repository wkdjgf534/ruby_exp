class CreatePosts < ActiveRecord::Migration[8.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.string :title, null: false, limit: 255
      t.string :content

      t.timestamps
    end
  end
end
