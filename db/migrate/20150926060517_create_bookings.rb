class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
