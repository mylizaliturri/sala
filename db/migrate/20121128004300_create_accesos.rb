class CreateAccesos < ActiveRecord::Migration
  def change
    create_table :accesos do |t|
      t.string :userid
      t.string :string
      t.string :clave
      t.string :string
      t.string :time
      t.string :text

      t.timestamps
    end
  end
end
