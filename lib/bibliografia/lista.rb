Nodo = Struct.new(:value,:next,:prev)

class Lista
    include Enumerable
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
    
    def insertar (elemento) #por el final
        nodo = Nodo.new(elemento,nil,nil)
        if(vacia == true)
            @final = nodo
            @inicio = nodo
        else
            nodo.prev = @final
            @final.next = nodo
            @final = nodo
        end
        true
    end
    
    def extraer #por el inicio
        if(vacia == true)
            return false
        else
            valor = @inicio.value
            @inicio = @inicio.next
            if(vacia == false)
                @inicio.prev = nil
            end
            return valor
        end
    end
    
    def insertar_inicio (elemento)
        nodo = Nodo.new(elemento,nil,nil)
        if(vacia == true)
            @final = nodo
            @inicio = nodo
        else
            nodo.next = @inicio
            @inicio.prev = nodo
            @inicio = nodo
        end
        true
    end
    
    def extraer_final
        if(vacia == true)
            return false
        else
            valor = @final.value
            @final = @final.prev
            if(@final == nil)
                @inicio = nil
            else
                @final.next = nil
            end
            return valor
        end
    end
    
    def each
        nodo = @inicio
        while (nodo != nil)
            yield nodo.value
            nodo = nodo.next
        end
    end
end