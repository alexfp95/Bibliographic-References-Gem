Nodo = Struct.new(:value,:next)

class Lista
    attr_reader :inicio, :final
    
    def initialize
        @inicio = nil
        @final = nil
    end
    
    def vacia
        if (@inicio == nil)
            return true
        else
            return false
        end
    end
    
    def insertar (elemento)
        nodo = Nodo.new(elemento,nil)
        if(vacia)
            @inicio = nodo
            @final = @inicio
        else
            @final.next = nodo
            @final = nodo
        end
        true
    end
    
    def extraer
        if(vacia)
            return false
        else
            nodo = @inicio
            @inicio = @inicio.next
            return nodo.value
        end
    end
        
end