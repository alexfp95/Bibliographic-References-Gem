Nodo = Struct.new(:value,:next)

class Lista
    attr_reader :inicio, :final
    
    def initialize()
        @inicio = nil
        @final = nil
    end
end