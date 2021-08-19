class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :body
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
