require 'bibliografia/bibliog'
require 'bibliografia/lista'

class Cita
    attr_reader :ref
    
    def initialize (r)
       @ref=r 
    end

    def get_autores
        size = @ref.autores.length
        if (size == 1)
            cadena = "Autor, "
            cadena = "#{cadena}"+"#{@ref.autores[1][0]}. "
            cadena = "#{cadena}"+"#{@ref.autores[0][0]}. "
        else
            i = 0
            while i < size
                cadena = "Autor, "
                cadena = "#{cadena}"+"#{@ref.autores[i][1][0]}. "
                cadena = "#{cadena}"+"#{@ref.autores[i][0][0]}. "
                i = i+1
            end
            cadena
        end
    end
end