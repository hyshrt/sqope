class CreateSearchParameterSaves < ActiveRecord::Migration[6.1]
  def change
    create_table :search_parameter_saves do |t|
      t.references :user, null: false, foreign_key: true
      t.references :area, null: true, foreign_key: true
      t.references :target, null: true, foreign_key: true
      t.references :field, null: true, foreign_key: true
      t.string :search_name

      t.timestamps
    end
  end
end
