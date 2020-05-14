class CreateAchievements < ActiveRecord::Migration[6.0]
  def change
    create_table :achievements do |t|
      t.title :string
      t.description :string
      t.value :integer
      t.completed :boolean
      t.timestamps
    end
  end
end
