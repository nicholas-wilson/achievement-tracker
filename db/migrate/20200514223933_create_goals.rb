class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.string :category
      t.integer :user_id
      t.integer :achievement_id
      t.timestamps
    end
  end
end
