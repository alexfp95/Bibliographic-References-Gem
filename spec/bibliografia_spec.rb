require 'spec_helper'
require 'bibliografia/bibliog'
require 'bibliografia/lista'
require 'bibliografia/cita'

describe Bibliog do
    before :all do              
        @b1 = Bibliog.new(['Dave','Andy','Chad'], ['Thomas', 'Hunt', 'Fowler'], 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide', 'Pragmatic Bookshelf', 4, 'July 7', 2013, ['9781937785499', '1937785491'], 'The Facets of Ruby')
        @b2 = Bibliog.new(['Dave','Andy','Chad'], ['Thomas', 'Hunt', 'Fowler'], 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide', 'Pragmatic Bookshelf', 4, 'July 7', 2013, ['9781937785499', '1937785491'])
    end
    describe "# almacenamiento de autores" do
        it "Debe existir uno o mas autores" do
            expect(@b1.autores).to eq(['Dave','Andy','Chad'])
            expect(@b1.apellidos).to eq(['Thomas', 'Hunt', 'Fowler'])
        end
    end
    describe "# almacenamiento de titulo" do
        it "Debe existir un titulo" do
            expect(@b1.titulo).to eq('Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide')
        end
    end
    describe "# almacenamiento de serie" do
        it "Debe existir una serie" do
            expect(@b1.serie).to eq('The Facets of Ruby')
        end
        it "No debe existir una serie" do
            expect(@b2.serie).to eq('none')
        end
    end
    describe "# almacenamiento de editorial" do
        it "Debe existir una editorial" do
            expect(@b1.editorial).to eq('Pragmatic Bookshelf')
        end
    end
    describe "# almacenamiento de edicion" do
        it "Debe existir un numero de edicion" do
            expect(@b1.edicion).to eq(4)
        end
    end
    describe "# almacenamiento de fecha" do
        it "Debe existir un dia y un mes" do
            expect(@b1.mes).to eq('July 7')
        end
        it "Debe existir un año" do
            expect(@b1.anno).to eq(2013)
        end
    end
    describe "# almacenamiento de uno o mas ISBN" do
        it "Debe existir uno o mas ISBN" do
            expect(@b1.isbn).to eq(['9781937785499', '1937785491'])
        end
    end
    describe "# metodo para obtener los autores" do
        it "Debe existir un metodo para obtener la lista de autores" do
            expect(@b1.get_autores).to eq("Dave Thomas, Andy Hunt, Chad Fowler")
        end
    end
    describe "# metodo para obtener el titulo" do
        it "Debe existir un metodo para obtener el titulo" do
            expect(@b1.get_titulo).to eq("Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide")
        end
    end
    describe "# metodo para obtener la serie" do
        it "Debe existir un metodo para obtener la serie" do
            expect(@b1.get_serie).to eq("The Facets of Ruby")
        end
    end
    describe "# metodo para obtener la editorial" do
        it "Debe existir un metodo para obtener la editorial" do
            expect(@b1.get_editorial).to eq("Pragmatic Bookshelf")
        end
    end
    describe "# metodo para obtener el numero de edicion" do
        it "Debe existir un metodo para obtener el numero de edicion" do
            expect(@b1.get_edicion).to eq("4")
        end
    end
    describe "# metodo para obtener la fecha" do
        it "Debe existir unmetodo para obtener la fecha" do
            expect(@b1.get_fecha).to eq("July 7, 2013")
        end
    end
    describe "# metodo para obtener los ISBN" do
        it "Debe existir un metodo para obtener los ISBN" do
            expect(@b1.get_isbn).to eq("ISBN-13: 978-1937785499\nISBN-10: 1937785491")
        end
    end
    describe "# formateo de la referencia" do
        it "Debe existir un metodo que formatee la referencia" do
            expect(@b1.to_s).to eq("Dave Thomas, Andy Hunt, Chad Fowler.\nProgramming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide\n(The Facets of Ruby)\nPragmatic Bookshelf; 4 edition (July 7, 2013)\nISBN-13: 978-1937785499\nISBN-10: 1937785491")
        end
    end
end

describe Nodo do
    before :all do
        @nodo1 = Nodo.new(1,2,3);
    end
    describe "# almacenamiento de un valor" do
        it "Debe existir un valor" do
            expect(@nodo1.value).to eq(1)
        end
    end
    describe "# almacenamiento de un siguiente" do
        it "Debe existir un siguiente" do
            expect(@nodo1.next).to eq(2)
        end
    end
    describe "# almacenamiento de un anterior" do
        it "Debe existir un anterior" do
            expect(@nodo1.prev).to eq(3)
        end
    end
end

describe Lista do           
    before :each do
        @b1 = Bibliog.new(['Dave','Andy','Chad'], ['Thomas', 'Hunt', 'Fowler'], 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide', 'Pragmatic Bookshelf', 4, 'July 7', 2013, ['9781937785499', '1937785491'], 'The Facets of Ruby')
        @b2 = Bibliog.new('Scott', 'Chacon', 'Pro Git 2009th Edition', 'Apress', 2009, 'August 27', 2009, ['9781430218333','1430218339'], 'Pro')
        @b3 = Bibliog.new(['David','Yukihiro'],['Flanagan','Matsumoto'], 'The Ruby Programming Language', 'O’Reilly Media', 1, 'February 4', 2008, ['0596516177','9780596516178'])
        @b4 = Bibliog.new(['David','Dave','Bryan','Dan','Zach','Aslak'], ['Chelimsky','Astels','Helmkamp','North','Dennis','Hellesoy'],'The RSpecBook: Behaviour Driven Development with RSpec, Cucumber, and Friends', 'Pragmatic Bookshelf', 1, 'December 25', 2010, ['1934356379','9781934356371'], 'The Facets of Ruby')
        @b5 = Bibliog.new('Richard','E. Silverman','Git Pocket Guide', 'O’Reilly Media', 1, 'August 2', 2013, ['1449325866','9781449325862'])
        @lista = Lista.new()
        @lista2 = Lista.new()
        @lista3 = Lista.new()
    end
    describe "# creacion de una lista" do
        it "Debe existir un nodo inicio nulo" do
            expect(@lista.inicio).to eq(nil)
        end
        it "Debe existir un nodo final nulo" do
            expect(@lista.final).to eq(nil)
        end
    end
    describe "# metodo para ver si esta vacia" do
        it "Debe existir un metodo para ver si esta vacia" do
            expect(@lista.vacia).to eq(true)
        end
    end
    describe "# metodo para insertar y metodo para extraer un elemento" do
        it "Debe existir un metodo para insertar un elemento y otro para extraerlo" do
            expect(@lista2.insertar(@b1)).to eq(true)
            expect(@lista2.extraer).to eq(@b1)
        end
    end
    describe "# insertar y extraer varios elementos" do
        it "Se puede insertar y extraer varios elementos" do
            expect(@lista3.insertar(@b1)).to eq(true)
            expect(@lista3.insertar(@b2)).to eq(true)
            expect(@lista3.insertar(@b3)).to eq(true)
            expect(@lista3.insertar(@b4)).to eq(true)
            expect(@lista3.insertar(@b5)).to eq(true)
            expect(@lista3.extraer).to eq(@b1)
            expect(@lista3.extraer).to eq(@b2)
            expect(@lista3.extraer).to eq(@b3)
            expect(@lista3.extraer).to eq(@b4)
            expect(@lista3.extraer).to eq(@b5)
        end
    end
    describe "# insertar(inicio) y extraer(final)" do
        it "Se puede insertar por el inicio y extraer por el final" do
            expect(@lista3.insertar(@b2)).to eq(true)
            expect(@lista3.insertar_inicio(@b1)).to eq(true)
            expect(@lista3.extraer_final).to eq(@b2)
        end
    end
    
    describe "# haciendo la lista enumerable" do
        it "Comprobar el metodo max" do
            expect(@lista3.insertar(@b1)).to eq(true)
            expect(@lista3.insertar(@b2)).to eq(true)
            expect(@lista3.insertar(@b3)).to eq(true)
            expect(@lista3.insertar(@b4)).to eq(true)
            expect(@lista3.insertar(@b5)).to eq(true)
            expect(@lista3.max).to eq(@b3)
        end
        it "Comprobar el metodo min" do
            expect(@lista3.insertar(@b1)).to eq(true)
            expect(@lista3.insertar(@b2)).to eq(true)
            expect(@lista3.insertar(@b3)).to eq(true)
            expect(@lista3.insertar(@b4)).to eq(true)
            expect(@lista3.insertar(@b5)).to eq(true)
            expect(@lista3.min).to eq(@b5)
        end
        it "Comprobar el metodo sort" do
            expect(@lista3.insertar(@b1)).to eq(true)
            expect(@lista3.insertar(@b2)).to eq(true)
            expect(@lista3.insertar(@b3)).to eq(true)
            expect(@lista3.insertar(@b4)).to eq(true)
            expect(@lista3.insertar(@b5)).to eq(true)
            expect(@lista3.sort).to eq([@b5, @b2, @b1, @b4, @b3])
        end
    end
end

describe Libro do
    before :all do
        @l1 = Libro.new('Scott', 'Chacon', 'Pro Git 2009th Edition', 'Apress', 2009, 'August 27', 2009, ['9781430218333','1430218339'], 'Pro')
        @l2 = Libro.new('David', 'Flanagan', 'The Ruby Programming Language', 'O’Reilly Media', 1, 'February 4', 2008, ['0596516177','9780596516178'])
        @l3 = Libro.new('Scott', 'Chacon', 'Pro Git 2009th Edition', 'Apress', 2009, 'August 27', 2009, ['9781430218333','1430218339'], 'Pro')
        @l4 = Libro.new('Scott', 'Chacon', 'Pro Git 2009th Edition', 'Apress', 2009, 'August 27', 2015, ['9781430218333','1430218339'], 'Pro')
    end
    
    describe "# comprobar la instancia del objeto" do
        it "Es una la instancia de Libro" do
            expect(@l1.instance_of?Libro).to eq(true)
        end
    end
    
    describe " comprobar la jerarquia de clases del objeto" do
        it "Pertenece a la jerarquia de clase de Bibliog" do
            expect(@l1.is_a?Bibliog).to eq(true)
        end
        it "Pertenece a la jerarquia de clase de Object" do
            expect(@l1.is_a?Object).to eq(true)
        end
        it "Pertenece a la jerarquia de clase de BasicObject" do
            expect(@l1.is_a?BasicObject).to eq(true)
        end
    end
    
    describe "# comprobar la instancia del objeto con su madre" do
        it "No es una instancia de Bibliog" do
            expect(@l1.instance_of?Bibliog).to eq(false)
        end
    end
    
    describe "# comprobar si responde a un metodo de su madre" do
        it "Debe responder a un metodo de su madre" do
            expect(@l1.respond_to?(:autores)).to eq(true)
        end
    end
    
    describe "# comprobar si responde a un metodo propio" do
        it "Debe responder a un metodo propio" do
            expect(@l1.respond_to?(:isbnl)).to eq(true)
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
        @r1 = Revista.new('Felipe', 'Flores','Decoracion de hogar', 'Hogares', 5, 'January 1', 2015, 9857425)
    end
    
    describe "# comprobar la instancia del objeto" do
        it "Es una instancia de Revista" do
            expect(@r1.instance_of?Revista).to eq(true)
        end
    end
    
    describe " comprobar la jerarquia de clases del objeto" do
        it "Pertenece a la jerarquia de clase de Bibliog" do
            expect(@r1.is_a?Bibliog).to eq(true)
        end
        it "Pertenece a la jerarquia de clase de Object" do
            expect(@r1.is_a?Object).to eq(true)
        end
        it "Pertenece a la jerarquia de clase de BasicObject" do
            expect(@r1.is_a?BasicObject). to eq(true)
        end
    end
    
    describe "# comprobar la instancia del objeto con su madre" do
        it "No es una instancia de Bibliog" do
            expect(@r1.instance_of?Bibliog).to eq(false)
        end
    end
    
    describe "# comprobar si responde a un metodo de su madre" do
        it "Debe responder a un metodo de su madre" do
            expect(@r1.respond_to?(:autores)).to eq(true)
        end
    end
    
    describe "# comprobar si responde a un metodo propio" do
        it "Debe responder a un metodo propio" do
            expect(@r1.respond_to?(:issn)).to eq(true)
        end
    end
end

describe Periodico do
    before :all do
        @p1 = Periodico.new('Maria', 'Porr','Diario de avisos', 'Noticias', 1, 'February 10', 2013, 15)
    end
    
    describe "# comprobar la instancia del objeto" do
        it "Es una instancia de Periodico" do
            expect(@p1.instance_of?Periodico).to eq(true)
        end
    end
    
    describe "# comprobar la jerarquia de clases del objeto" do
        it "Pertenece a la jerarquia de clase de Bibliog" do
            expect(@p1.is_a?Bibliog).to eq(true)
        end
        it "Pertenece a la jerarquia de clase de Object" do
            expect(@p1.is_a?Object).to eq(true)
        end
        it "Pertenece a la jerarquia de clase de BasicObject" do
            expect(@p1.is_a?BasicObject).to eq(true)
        end
    end
    
    describe "# comprobar la instancia del objeto con su madre" do
        it "No es una instancia de Bibliog" do
            expect(@p1.instance_of?Bibliog).to eq(false)
        end
    end
    
    describe "# comprobar si responde a un metodo de su madre" do
        it "Debe responder a un metodo de su madre" do
            expect(@p1.respond_to?(:autores)).to eq(true)
        end
    end
    
    describe "# comprobar si responde a un metodo propio" do
        it "Debe responder a un metodo propio" do
            expect(@p1.respond_to?(:columnas)).to eq(true)
        end
    end
end

describe Electronico do
    before :all do
        @e1 = Electronico.new('Alexis', 'Duglash','Programa en Java', 'Programming', 3, 'November 17', 2015, 'www.urldelbook.com')
    end
    
    describe "# comprobar la instancia del objeto" do
        it "Es una instancia de Electronico" do
            expect(@e1.instance_of?Electronico).to eq(true)
        end
    end
    
    describe "# comprobar la jerarquia de clases del objeto" do
        it "Pertenece a la jerarquia de clase de Bibliog" do
            expect(@e1.is_a?Bibliog).to eq(true)
        end
        it "Pertenece a la jerarquia de clase de Object" do
            expect(@e1.is_a?Object).to eq(true)
        end
        it "Pertenece a la jerarquia de clase de BasicObject" do
            expect(@e1.is_a?BasicObject).to eq(true)
        end
    end
    
    describe "# comprobar la instancia del objeto con su madre" do
        it "No es una instancia de Bibliog" do
            expect(@e1.instance_of?Bibliog).to eq(false)
        end
    end
    
    describe "# comprobar si responde a un metodo de su madre" do
        it "Debe responder a un metodo de su madre" do
            expect(@e1.respond_to?(:autores)).to eq(true)
        end
    end
    
    describe "# comprobar si responde a un metodo propio" do
        it "Debe responder a un metodo propio" do
            expect(@e1.respond_to?(:url)).to eq(true)
        end
    end
end

describe "# comprobar si funciona Guard" do
    it "Esta prueba se escribe para modificar y guardar el archivo" do
    end
end

describe Cita do
    before :each do
        @l1 = Libro.new(['Scott'],['Chacon'], 'Pro Git 2009th Edition', 'Apress', 2009, 'August 27', 2009, ['9781430218333','1430218339'], 'Pro')
        @l2 = Libro.new(['David','Yukihiro'],['Flanagan','Matsumoto'], 'The Ruby Programming Language', 'O’Reilly Media', 1, 'February 4', 2008, ['0596516177','9780596516178'])
        @l3 = Libro.new(['Scott'],['Chacon'], 'Pro Git 2009th Edition', 'Apress', 2009, 'August 27', 2000, ['9781430218333','1430218339'], 'Pro')
        @l4 = Libro.new(['Scott'],['Chacon'], 'Abecedario', 'Apress', 2009, 'August 27', 2000, ['9781430218333','1430218339'], 'Pro')
        @r1 = Revista.new(['David'],['Flanagan'], 'revista de ruby', 'Pruebas', 1, 'February 4', 2015, ['0596586177','9780594516178'])
        @p1 = Periodico.new(['Maria'], ['Porr'],'Noticias', 'Diario de avisos', 1, 'February 10', 2013, 15)
        @e1 = Electronico.new(['Alexis'],['Duglash'],'Programa en Java', 'Programming', 3, 'November 17', 2015, 'www.urldelbook.com')
        @c1 = Cita.new(@l1)
        @c2 = Cita.new(@l2)
        @c3 = Cita.new(@l3)
        @c4 = Cita.new(@l4)
        @c5 = Cita.new(@r1)
        @c6 = Cita.new(@p1)
        @c7 = Cita.new(@e1)
        @citas = ListaCitas.new()
    end
    
    describe "#comprobar el almacenamiento de la referencia" do
        it "Debe existir una referencia" do
            expect(@c1.ref).to eq(@l1)
        end
    end
    
    describe "#comprobar el formateo de los autores" do
        it "Debe hacerce el formateo de un autor" do
            expect(@c1.get_autores).to eq('Autor, C. S. ')
        end
        it "Debe hacerce el formateo de varios autores" do
            expect(@c2.get_autores).to eq('Autor, F. D. & Autor, M. Y. ')
        end
    end
    
    describe "#comprobar la insercion y extraccion de una cita" do
        it "Debe insertarse una cita y extraerse" do
            expect(@citas.insertar(@c1)).to eq(true)
            expect(@citas.extraer).to eq(@c1)
        end
    end
    
    describe "#comprobar la ordenacion" do
        it "Las citas deben estar ordenadas" do
            expect(@citas.insertar(@c2)).to eq(true)
            expect(@citas.insertar(@c1)).to eq(true)
            expect(@citas.insertar(@c3)).to eq(true)
            expect(@citas.insertar(@c4)).to eq(true)
            expect(@citas.insertar(@c5)).to eq(true)
            expect(@citas.lordenada).to eq([@c4,@c3,@c1,@c5,@c2])
        end
    end
    
    describe "#comprobar las mayusculas" do
        it "La primera letra de cada palabra del titulo debe estar en mayusculas" do
            expect(@c5.get_titulo).to eq('Revista De Ruby')
        end
    end
    
    describe "#comprobar el formateo" do
        it "Formateo de un libro" do
            expect(@c2.to_s).to eq('Autor, F. D. & Autor, M. Y. (2008).  Titulo del libro: The Ruby Programming Language (1).  Lugar de publicacion: O’Reilly Media.  ')
            expect(@c5.to_s).to eq('Autor, F. D. (2015).  Titulo de la revista: Revista De Ruby (1).  Lugar de publicacion: Pruebas.  ')
            expect(@c6.to_s).to eq('Autor, P. M. (2013).  Titulo del articulo: Noticias (1).  Columnas: 15.  Lugar de publicacion: Diario de avisos.  ')
            expect(@c7.to_s).to eq('Autor, D. A. (2015).  Titulo: Programa en Java (3).  Lugar de publicacion: Programming.  Disponible en: www.urldelbook.com  ')
        end
    end
end