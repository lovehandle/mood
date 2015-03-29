class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :to_id, index: true, foreign_key: true
      t.integer :from_id, index: true, foreign_key: true
      t.integer :remote_id
      t.text :body
      t.integer :status, default: 0
      t.string :status_details
      t.timestamps null: false
    end
  end
end
