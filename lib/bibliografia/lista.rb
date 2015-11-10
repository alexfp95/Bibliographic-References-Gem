Nodo = Struct.new(:value,:next)

class Lista
    attr_reader :inicio, :final
    
    def initialize()
        @inicio = nil
        @final = nil
    end
    
    def vacia ()
        if (inicio == nil)
            return true
        else
            return false
        end
    end
end