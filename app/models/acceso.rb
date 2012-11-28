class Acceso < ActiveRecord::Base
  attr_accessible :clave, :string, :string, :text, :time, :userid
end
