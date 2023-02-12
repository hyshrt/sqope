class CreateProgramAreas < ActiveRecord::Migration[6.1]
  def change
    create_table :program_areas do |t|
      t.references :program, null: false, foreign_key: true
      t.references :area, null: false, foreign_key: true

      t.timestamps
    end
  end
end
