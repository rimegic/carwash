class CreateWashLogs < ActiveRecord::Migration[8.0]
  def change
    create_table :wash_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :washed_at

      t.timestamps
    end
  end
end
