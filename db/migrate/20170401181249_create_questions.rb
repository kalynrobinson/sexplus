class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.belongs_to :category, foreign_key: true

      t.string :name
      t.text :description
      t.string :input_type
      t.string :options, array: true
      t.integer :parent_id
      t.string :genitalia


      t.timestamps
    end
  end
end
