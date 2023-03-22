class CreateStars < ActiveRecord::Migration[5.2]
  def change
    create_table :stars do |t|
      t.string :name
      t.string :type
      t.integer :age
      t.float :size
      t.boolean :can_nova
    end
  end
end
