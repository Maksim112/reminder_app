class CreateEventTypePlans < ActiveRecord::Migration
  def change
    create_table :event_type_plans do |t|
      t.references :event_type, index: true, foreign_key: true
      t.references :plan, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
