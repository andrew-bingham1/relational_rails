class CreatePlanets < ActiveRecord::Migration[5.2]
  def change
    create_table :planets do |t|
      t.string :name
      t.string :type
      t.integer :diameter
      t.integer :num_moons
      t.boolean :has_life
      t.references :star, foreign_key: true
    end
  end
end
