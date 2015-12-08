require 'bibliografia/bibliog'
require 'bibliografia/lista'

class Cita
    attr_reader :ref
    
    def initialize (r)
       @ref=r 
    end

    def get_autores
        size = @ref.autores.length
        i = 0
        while i < (size-1)
            cadena = "#{cadena}"+"Autor, "
            cadena = "#{cadena}"+"#{@ref.apellidos[i][0]}. #{@ref.autores[i][0]}. & "
            i = i+1
        end
        cadena = "#{cadena}"+"Autor, "
        cadena = "#{cadena}"+"#{@ref.apellidos[i][0]}. #{@ref.autores[i][0]}. "
    end
end

class ListaCitas
    attr_accessor :lista
    
    def initialize
        @lista = Lista.new()
    end
end