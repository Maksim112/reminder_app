class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :event_type, index: true, foreign_key: true
      t.boolean :completed
      t.string :text
      t.datetime :time
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
