class Livro {
  int id;
  String titulo;
  String autor;
  String sinopse;
  String capa;
  String editora;
  List<dynamic> categoria;
  String isbn;
  double preco;

  Livro(
      {required this.id,
      required this.titulo,
      required this.autor,
      required this.sinopse,
      required this.capa,
      required this.editora,
      required this.categoria,
      required this.isbn,
      required this.preco});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'autor': autor,
     'sinopse': sinopse,
      'capa': capa,
      'editora': editora,
      'categoria': categoria,
      'isbn': isbn,
      'preco': preco,
    };
  }

  factory Livro.fromJson(Map<String, dynamic> map){
    return Livro(
      id: map['id'],
      titulo: map['titulo'],
      autor: map['autor'],
      sinopse: map['sinopse'],
      capa: map['capa'],
      editora: map['editora'],
      categoria: map['categoria'],
      isbn: map['isbn'],
      preco: map['preco'],
    );
  }
}
