class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :time_offset
      t.integer :zone_offset
      t.references :question, index: true, foreign_key: true
      t.integer :from_id, index: true, foreign_key: true
      t.integer :to_id, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
