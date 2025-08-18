class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :workout, null: false, foreign_key: true
      t.timestamps
    end

     # 同じユーザーが同じ投稿に複数いいねできないようにユニーク制約
     add_index :likes, [:user_id, :workout_id], unique: true
  end
end
