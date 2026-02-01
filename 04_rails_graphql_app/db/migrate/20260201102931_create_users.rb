class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :name, limit: 200
      t.string :email, limit: 200, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
