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
        @nodo1 = Nodo.new(1,2);
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
end

describe Lista do
    before :all do
        @b1 = Bibliog.new(['Dave Thomas','Andy Hunt','Chad Fowler'], 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide', 'Pragmatic Bookshelf', 4, 'July 7', 2013, ['9781937785499', '1937785491'], 'The Facets of Ruby')
        @lista = Lista.new();
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
end