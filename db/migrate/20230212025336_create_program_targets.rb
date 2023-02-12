class CreateProgramTargets < ActiveRecord::Migration[6.1]
  def change
    create_table :program_targets do |t|
      t.references :program, null: false, foreign_key: true
      t.references :target, null: false, foreign_key: true

      t.timestamps
    end
  end
end
