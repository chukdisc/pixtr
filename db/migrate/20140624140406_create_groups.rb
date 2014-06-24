class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.text :description, null: false

      t.timestamp null: false
    end

    add_index :groups, :name, unique: true
  end
end
