class CreateWorkoutDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :workout_details do |t|
      t.references :workout, null: false, foreign_key: true
      t.string :body_part
      t.string :exercise_name
      t.integer :weight
      t.integer :reps
      t.integer :sets

      t.timestamps
    end
  end
end
