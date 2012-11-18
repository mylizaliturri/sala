class Usuario < ActiveRecord::Base
  attr_accessible :apellido, :autorizado, :clave, :correo, :nombre, :perfil, :twitter
end
