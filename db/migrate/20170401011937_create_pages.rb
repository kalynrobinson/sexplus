class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :home
      t.string :help
      t.string :about

      t.timestamps
    end
  end
end
