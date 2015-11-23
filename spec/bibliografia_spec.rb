require 'spec_helper'
require 'bibliografia/bibliog'
require 'bibliografia/lista'

describe Bibliog do
    before :all do
        @b1 = Bibliog.new(['Dave Thomas','Andy Hunt','Chad Fowler'], 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide', 'Pragmatic Bookshelf', 4, 'July 7', 2013, ['9781937785499', '1937785491'], 'The Facets of Ruby')
        @b2 = Bibliog.new(['Dave Thomas','Andy Hunt','Chad Fowler'], 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide', 'Pragmatic Bookshelf', 4, 'July 7', 2013, ['9781937785499', '1937785491'])
    end
    describe "# almacenamiento de autores" do
        it "Debe existir uno o mas autores" do
             @b1.autores.should eq(['Dave Thomas', 'Andy Hunt','Chad Fowler'])
        end
    end
    describe "# almacenamiento de titulo" do
        it "Debe existir un titulo" do
             @b1.titulo.should eq('Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide')
        end
    end
    describe "# almacenamiento de serie" do
        it "Debe existir una serie" do
             @b1.serie.should eq('The Facets of Ruby')
        end
        it "No debe existir una serie" do
             @b2.serie.should eq('none')
        end
    end
    describe "# almacenamiento de editorial" do
        it "Debe existir una editorial" do
             @b1.editorial.should eq('Pragmatic Bookshelf')
        end
    end
    describe "# almacenamiento de edicion" do
        it "Debe existir un numero de edicion" do
             @b1.edicion.should eq(4)
        end
    end
    describe "# almacenamiento de fecha" do
        it "Debe existir un dia y un mes" do
             @b1.mes.should eq('July 7')
        end
        it "Debe existir un año" do
             @b1.anno.should eq(2013)
        end
    end
    describe "# almacenamiento de uno o mas ISBN" do
        it "Debe existir uno o mas ISBN" do
             @b1.isbn.should eq(['9781937785499', '1937785491'])
        end
    end
    describe "# metodo para obtener los autores" do
        it "Debe existir un metodo para obtener la lista de autores" do
             @b1.get_autores.should eq("Dave Thomas, Andy Hunt, Chad Fowler")
        end
    end
    describe "# metodo para obtener el titulo" do
        it "Debe existir un metodo para obtener el titulo" do
             @b1.get_titulo.should eq("Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide")
        end
    end
    describe "# metodo para obtener la serie" do
        it "Debe existir un metodo para obtener la serie" do
             @b1.get_serie.should eq("The Facets of Ruby")
        end
    end
    describe "# metodo para obtener la editorial" do
        it "Debe existir un metodo para obtener la editorial" do
             @b1.get_editorial.should eq("Pragmatic Bookshelf")
        end
    end
    describe "# metodo para obtener el numero de edicion" do
        it "Debe existir un metodo para obtener el numero de edicion" do
             @b1.get_edicion.should eq("4")
        end
    end
    describe "# metodo para obtener la fecha" do
        it "Debe existir unmetodo para obtener la fecha" do
             @b1.get_fecha.should eq("July 7, 2013")
        end
    end
    describe "# metodo para obtener los ISBN" do
        it "Debe existir un metodo para obtener los ISBN" do
             @b1.get_isbn.should eq("ISBN-13: 978-1937785499\nISBN-10: 1937785491")
        end
    end
    describe "# formateo de la referencia" do
        it "Debe existir un metodo que formatee la referencia" do
            @b1.to_s.should eq("Dave Thomas, Andy Hunt, Chad Fowler.\nProgramming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide\n(The Facets of Ruby)\nPragmatic Bookshelf; 4 edition (July 7, 2013)\nISBN-13: 978-1937785499\nISBN-10: 1937785491")
        end
    end
end

describe Nodo do
    before :all do
        @nodo1 = Nodo.new(1,2,3);
    end
    describe "# almacenamiento de un valor" do
        it "Debe existir un valor" do
            @nodo1.value.should eq(1)
        end
    end
    describe "# almacenamiento de un siguiente" do
        it "Debe existir un siguiente" do
            @nodo1.next.should eq(2)
        end
    end
    describe "# almacenamiento de un anterior" do
        it "Debe existir un anterior" do
            @nodo1.prev.should eq(3)
        end
    end
end

describe Lista do
    before :each do
        @b1 = Bibliog.new(['Dave Thomas','Andy Hunt','Chad Fowler'], 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide', 'Pragmatic Bookshelf', 4, 'July 7', 2013, ['9781937785499', '1937785491'], 'The Facets of Ruby')
        @b2 = Bibliog.new('Scott Chacon', 'Pro Git 2009th Edition', 'Apress', 2009, 'August 27', 2009, ['9781430218333','1430218339'], 'Pro')
        @b3 = Bibliog.new(['David Flanagan','Yukihiro Matsumoto'], 'The Ruby Programming Language', 'O’Reilly Media', 1, 'February 4', 2008, ['0596516177','9780596516178'])
        @b4 = Bibliog.new(['David Chelimsky','Dave Astels','Bryan Helmkamp','Dan North','Zach Dennis','Aslak Hellesoy'], 'The RSpecBook: Behaviour Driven Development with RSpec, Cucumber, and Friends', 'Pragmatic Bookshelf', 1, 'December 25', 2010, ['1934356379','9781934356371'], 'The Facets of Ruby')
        @b5 = Bibliog.new('Richard E. Silverman','Git Pocket Guide', 'O’Reilly Media', 1, 'August 2', 2013, ['1449325866','9781449325862'])
        @lista = Lista.new()
        @lista2 = Lista.new()
        @lista3 = Lista.new()
    end
    describe "# creacion de una lista" do
        it "Debe existir un nodo inicio nulo" do
            @lista.inicio.should eq(nil)
        end
        it "Debe existir un nodo final nulo" do
            @lista.final.should eq(nil)
        end
    end
    describe "# metodo para ver si esta vacia" do
        it "Debe existir un metodo para ver si esta vacia" do
            @lista.vacia.should eq(true)
        end
    end
    describe "# metodo para insertar y metodo para extraer un elemento" do
        it "Debe existir un metodo para insertar un elemento y otro para extraerlo" do
            @lista2.insertar(@b1).should eq(true)
            @lista2.extraer.should eq(@b1)
        end
    end
    describe "# insertar y extraer varios elementos" do
        it "Se puede insertar y extraer varios elementos" do
            @lista3.insertar(@b1).should eq(true)
            @lista3.insertar(@b2).should eq(true)
            @lista3.insertar(@b3).should eq(true)
            @lista3.insertar(@b4).should eq(true)
            @lista3.insertar(@b5).should eq(true)
            @lista3.extraer.should eq(@b1)
            @lista3.extraer.should eq(@b2)
            @lista3.extraer.should eq(@b3)
            @lista3.extraer.should eq(@b4)
            @lista3.extraer.should eq(@b5)
        end
    end
    describe "# insertar(inicio) y extraer(final)" do
        it "Se puede insertar por el inicio y extraer por el final" do
            @lista3.insertar(@b2).should eq(true)
            @lista3.insertar_inicio(@b1).should eq(true)
            @lista3.extraer_final.should eq(@b2)
        end
    end
end

describe Libro do
    before :all do
        @l1 = Libro.new('Scott Chacon', 'Pro Git 2009th Edition', 'Apress', 2009, 'August 27', 2009, ['9781430218333','1430218339'], 'Pro')
        @l2 = Libro.new('David Flanagan', 'The Ruby Programming Language', 'O’Reilly Media', 1, 'February 4', 2008, ['0596516177','9780596516178'])
        @l3 = Libro.new('Scott Chacon', 'Pro Git 2009th Edition', 'Apress', 2009, 'August 27', 2009, ['9781430218333','1430218339'], 'Pro')
        @l4 = Libro.new('Scott Chacon', 'Pro Git 2009th Edition', 'Apress', 2009, 'August 27', 2015, ['9781430218333','1430218339'], 'Pro')
    end
    
    describe "# comprobar la instancia del objeto" do
        it "Es una la instancia de Libro" do
           (@l1.instance_of?Libro).should eq(true)
        end
    end
    
    describe " comprobar la jerarquia de clases del objeto" do
        it "Pertenece a la jerarquia de clase de Bibliog" do
            (@l1.is_a?Bibliog).should eq(true)
        end
        it "Pertenece a la jerarquia de clase de Object" do
            (@l1.is_a?Object).should eq(true)
        end
        it "Pertenece a la jerarquia de clase de BasicObject" do
            (@l1.is_a?BasicObject).should eq(true)
        end
    end
    
    describe "# comprobar la instancia del objeto con su madre" do
        it "No es una instancia de Bibliog" do
            (@l1.instance_of?Bibliog).should eq(false)
        end
    end
    
    describe "# comprobar si responde a un metodo de su madre" do
        it "Debe responder a un metodo de su madre" do
            @l1.respond_to?(:autores).should eq(true)
        end
    end
    
    describe "# comprobar si responde a un metodo propio" do
        it "Debe responder a un metodo propio" do
            @l1.respond_to?(:isbnl).should eq(true)
        end
    end
    
    describe "# expectativas para comparar dos referencias" do
        it "El libro @l1 es menor que el libro @l2" do
            expect(@l1 < @l2).to eq(true)
        end
        it "El libro @l1 es menor o igual que el libro @l2" do
            expect(@l1 <= @l2).to eq(true)
        end
        it "El libro @l2 es mayor que el libro @l1" do
            expect(@l2 > @l1).to eq(true)
        end
        it "El libro @l2 es mayor o igual que el libro @l1" do
            expect(@l2 >= @l1).to eq(true)
        end
        it "El libro @l1 es igual que el libro @l3" do
            expect(@l1 == @l3).to eq(true)
        end
        it "El libro @l1 es distinto que el libro @l4" do
            expect(@l1 == @l4).to eq(false)
        end
    end
end

describe Revista do
    before :all do
        @r1 = Revista.new('Felipe', 'Decoracion de hogar', 'Hogares', 5, 'January 1', 2015, 9857425)
    end
    
    describe "# comprobar la instancia del objeto" do
        it "Es una instancia de Revista" do
           (@r1.instance_of?Revista).should eq(true)
        end
    end
    
    describe " comprobar la jerarquia de clases del objeto" do
        it "Pertenece a la jerarquia de clase de Bibliog" do
            (@r1.is_a?Bibliog).should eq(true)
        end
        it "Pertenece a la jerarquia de clase de Object" do
            (@r1.is_a?Object).should eq(true)
        end
        it "Pertenece a la jerarquia de clase de BasicObject" do
            (@r1.is_a?BasicObject).should eq(true)
        end
    end
    
    describe "# comprobar la instancia del objeto con su madre" do
        it "No es una instancia de Bibliog" do
            (@r1.instance_of?Bibliog).should eq(false)
        end
    end
    
    describe "# comprobar si responde a un metodo de su madre" do
        it "Debe responder a un metodo de su madre" do
            @r1.respond_to?(:autores).should eq(true)
        end
    end
    
    describe "# comprobar si responde a un metodo propio" do
        it "Debe responder a un metodo propio" do
            @r1.respond_to?(:issn).should eq(true)
        end
    end
end

describe Periodico do
    before :all do
        @p1 = Periodico.new('Maria', 'Diario de avisos', 'Noticias', 1, 'February 10', 2013, 15)
    end
    
    describe "# comprobar la instancia del objeto" do
        it "Es una instancia de Periodico" do
           (@p1.instance_of?Periodico).should eq(true)
        end
    end
    
    describe "# comprobar la jerarquia de clases del objeto" do
        it "Pertenece a la jerarquia de clase de Bibliog" do
            (@p1.is_a?Bibliog).should eq(true)
        end
        it "Pertenece a la jerarquia de clase de Object" do
            (@p1.is_a?Object).should eq(true)
        end
        it "Pertenece a la jerarquia de clase de BasicObject" do
            (@p1.is_a?BasicObject).should eq(true)
        end
    end
    
    describe "# comprobar la instancia del objeto con su madre" do
        it "No es una instancia de Bibliog" do
            (@p1.instance_of?Bibliog).should eq(false)
        end
    end
    
    describe "# comprobar si responde a un metodo de su madre" do
        it "Debe responder a un metodo de su madre" do
            @p1.respond_to?(:autores).should eq(true)
        end
    end
    
    describe "# comprobar si responde a un metodo propio" do
        it "Debe responder a un metodo propio" do
            @p1.respond_to?(:columnas).should eq(true)
        end
    end
end

describe Electronico do
    before :all do
        @e1 = Electronico.new('Alexis', 'Programa en Java', 'Programming', 3, 'November 17', 2015, 'www.urldelbook.com')
    end
    
    describe "# comprobar la instancia del objeto" do
        it "Es una instancia de Electronico" do
           (@e1.instance_of?Electronico).should eq(true)
        end
    end
    
    describe "# comprobar la jerarquia de clases del objeto" do
        it "Pertenece a la jerarquia de clase de Bibliog" do
            (@e1.is_a?Bibliog).should eq(true)
        end
        it "Pertenece a la jerarquia de clase de Object" do
            (@e1.is_a?Object).should eq(true)
        end
        it "Pertenece a la jerarquia de clase de BasicObject" do
            (@e1.is_a?BasicObject).should eq(true)
        end
    end
    
    describe "# comprobar la instancia del objeto con su madre" do
        it "No es una instancia de Bibliog" do
            (@e1.instance_of?Bibliog).should eq(false)
        end
    end
    
    describe "# comprobar si responde a un metodo de su madre" do
        it "Debe responder a un metodo de su madre" do
            @e1.respond_to?(:autores).should eq(true)
        end
    end
    
    describe "# comprobar si responde a un metodo propio" do
        it "Debe responder a un metodo propio" do
            @e1.respond_to?(:url).should eq(true)
        end
    end
end

describe "# comprobar si funciona Guard" do
    it "Esta prueba se escribe para modificar y guardar el archivo" do
    end
end