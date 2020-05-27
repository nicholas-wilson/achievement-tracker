class CreateAchievements < ActiveRecord::Migration[6.0]
  def change
    create_table :achievements do |t|
      t.string :title
      t.string :description
      t.integer :value
      t.boolean :completed
      t.integer :user_id
      t.integer :goal_id
      t.timestamps
    end
  end
end
