class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.belongs_to :category, foreign_key: true

      t.string :name
      t.text :description
      t.hstore :options, index: true, using: :gist

      t.timestamps
    end
  end
end
