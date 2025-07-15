class CreateDailySignups < ActiveRecord::Migration[8.0]
  def change
    create_table :daily_signups do |t|
      t.date :date
      t.integer :count

      t.timestamps
    end
  end
end
