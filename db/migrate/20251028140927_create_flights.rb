class CreateFlights < ActiveRecord::Migration[8.0]
  def change
    create_table :flights do |t|
      t.references :departure, null: false, foreign_key: { to_table: :airports }
      t.references :arrival, null: false, foreign_key: { to_table: :airports }
      t.datetime :start_datetime
      t.integer :duration

      t.timestamps
    end
  end
end
