class CreateSchedule < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.string :weekdays
      t.integer :abertura
      t.integer :fechamento
      t.boolean :fechado, default: false
      t.references :unit, null: false, foreign_key: true
      t.timestamps
    end
  end
end
