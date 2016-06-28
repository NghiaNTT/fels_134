class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.integer :targer_id
      t.integer :action_type

      t.timestamps null: false
    end
  end
end
