class CreatePrograms < ActiveRecord::Migration[6.1]
  def change
    create_table :programs do |t|
      t.references :funder, null: false, foreign_key: true
      t.string :program_name, null: false
      t.datetime :start_datetime, null: false
      t.datetime :end_datetime, null: false
      t.string :grant_amount, null: false
      t.text :overview, null: false
      t.string :url
      t.string :determining_time, null: false
      t.string :implementation_period, null: false
      t.string :payment_method, null: false
      t.string :selection_method, null: false
      t.string :use, null: false
      t.string :self_pay, null: false
      t.string :essential_point
      t.string :program_logo
      t.string :message
      t.date :release_date
      t.date :stop_date
      t.integer :release_and_status, null: false, default: "0"
      t.integer :program_state, null: false, default: "0"

      t.timestamps
    end
  end
end
