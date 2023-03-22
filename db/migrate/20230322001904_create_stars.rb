class CreateStars < ActiveRecord::Migration[5.2]
  def change
    create_table :stars do |t|
      t.string :name
      t.string :star_type
      t.float :age
      t.string :size
      t.boolean :can_nova

      t.timestamps
    end
  end
end
