class CreateUserPairs < ActiveRecord::Migration[5.0]
  def change
    create_table :user_pairs do |t|
      # Relationships
      t.belongs_to :user1
      t.belongs_to :user2
      t.belongs_to :survey, foreign_key: true

      # User1 info
      t.string :user1_name
      t.string :user1_genitals
      t.string :user1_email

      # User2 info
      t.string :user2_name
      t.string :user2_genitals
      t.string :user2_email

      t.timestamps
    end
  end
end
