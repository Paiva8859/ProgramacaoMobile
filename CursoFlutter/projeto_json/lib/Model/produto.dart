class Produto {
  int id;
  String nome;
  String descricao;
  int quantidade;
  String foto;
  double preco;
  List<dynamic> categoria;

  Produto(
      {required this.id,
      required this.nome,
      required this.descricao,
      required this.quantidade,
      required this.foto,
      required this.preco,
      required this.categoria}) {
        
      }
}
