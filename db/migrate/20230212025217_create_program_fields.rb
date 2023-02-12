class CreateProgramFields < ActiveRecord::Migration[6.1]
  def change
    create_table :program_fields do |t|
      t.references :program, null: false, foreign_key: true
      t.references :field, null: false, foreign_key: true

      t.timestamps
    end
  end
end
