abstract class Livro {
  String titulo;
  String isbn;
  String dataLancamento;
  double preco;
  Autor autor;

  Livro(this.titulo, this.isbn, this.dataLancamento, this.preco, this.autor);
}

class Autor {
  String nome;
  String cpf;

  Autor(this.nome, this.cpf);
}

class Romance extends Livro {
  bool adaptado;

  Romance(titulo, isbn, dataLancamento, preco, autor, this.adaptado)
      : super(titulo, isbn, dataLancamento, preco, autor);
}

class AutoAjuda extends Livro {
  String area;

  AutoAjuda(titulo, isbn, dataLancamento, preco, autor, this.area)
      : super(titulo, isbn, dataLancamento, preco, autor);
}
