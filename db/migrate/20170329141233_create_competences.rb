class CreateCompetences < ActiveRecord::Migration[5.0]
  def change
    create_table :competences do |t|
      t.string :name
      t.integer :user_id
      t.integer :lvl

      t.timestamps
    end
  end
end
