class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :surname
      t.string :email
      t.text :about

      t.timestamps
    end
  end
end
