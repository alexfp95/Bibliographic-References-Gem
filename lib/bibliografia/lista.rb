Nodo = Struct.new(:value,:next,:prev)

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
        if(vacia == true)
            @final = nodo
            @inicio = nodo
        else
            @final.next = nodo
            @final = nodo
        end
        true
    end
    
    def extraer
        if(vacia == true)
            return false
        else
            valor = @inicio.value
            @inicio = @inicio.next
            return valor
        end
    end
        
end