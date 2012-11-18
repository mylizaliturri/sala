class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nombre
      t.string :apellido
      t.string :perfil
      t.string :correo
      t.string :clave
      t.string :twitter
      t.boolean :autorizado

      t.timestamps
    end
  end
end
