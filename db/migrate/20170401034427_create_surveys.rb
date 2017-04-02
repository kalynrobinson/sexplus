class CreateSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table :surveys do |t|
      t.string :token
      t.boolean :granular, default: false
      t.integer :taken, default: 0
      t.string :category_ids, array: true, default: []
      t.timestamps
    end
  end
end
