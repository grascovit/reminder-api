class CreateReminders < ActiveRecord::Migration[6.0]
  def change
    create_table :reminders do |t|
      t.text :description
      t.float :radius
      t.string :place_type
      t.string :place
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.references :user
      t.timestamp :last_notified_at

      t.timestamps
    end
  end
end
