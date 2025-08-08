class CreateWorkouts < ActiveRecord::Migration[6.1]
  def change
    create_table :workouts do |t|
      t.date :date
      t.text :memo
      t.boolean :is_public, default: true, null: false  # デフォルト値は公開、null禁止
      t.references :user
      t.timestamps
    end
  end
end
