class CreateAchievements < ActiveRecord::Migration[6.0]
  def change
    create_table :achievements do |t|
      t.string :title
      t.string :description
      t.integer :value
      t.boolean :completed
      t.timestamps
    end
  end
end
