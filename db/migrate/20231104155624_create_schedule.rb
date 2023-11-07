class CreateSchedule < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.string :weekdays
      t.string :hour
      t.references :unit, null: false, foreign_key: true
      t.timestamps
    end
  end
end
