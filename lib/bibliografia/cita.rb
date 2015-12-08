require 'bibliografia/bibliog'
require 'bibliografia/lista'

class Cita
    attr_reader :ref
    
    def initialize (r)
       @ref=r 
    end
end