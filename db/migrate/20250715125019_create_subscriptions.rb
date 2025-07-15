class CreateSubscriptions < ActiveRecord::Migration[8.0]
  def change
    create_table :subscriptions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :plan_name
      t.string :status
      t.datetime :expires_at

      t.timestamps
    end
  end
end
