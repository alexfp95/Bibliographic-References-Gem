require 'bibliografia/bibliog'
require 'bibliografia/lista'

class Cita
    attr_reader :ref
    
    def initialize (r)
       @ref=r 
    end

    def get_autores
        cadena = "Autor, "
        cadena = "#{cadena}"+"#{@ref.autores[1][0]}. "
        cadena = "#{cadena}"+"#{@ref.autores[0][0]}. "
    end
end