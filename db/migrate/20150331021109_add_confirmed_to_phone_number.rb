class AddConfirmedToPhoneNumber < ActiveRecord::Migration
  def change
    add_column :phones, :confirmed, :boolean
  end
end
