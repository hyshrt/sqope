class CreateFields < ActiveRecord::Migration[6.1]
  def change
    create_table :fields do |t|
      t.string :field_name

      t.timestamps
    end
  end
end
