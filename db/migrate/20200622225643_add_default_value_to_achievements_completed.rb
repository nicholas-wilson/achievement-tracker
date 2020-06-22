class AddDefaultValueToAchievementsCompleted < ActiveRecord::Migration[6.0]
  def change
    change_column_default :achievements, :completed, false
  end
end
