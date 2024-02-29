import 'package:app_animais/AnimalModel.dart';

class AnimalController{
  //atributos
  List<AnimalController> _listAnimal = [];

  //get da lista
  List get listarAnimais => _listAnimal;

  //adicionar animal
  void adicionarAnimal(especie, urlFoto, urlAudio){
    AnimalModel novoAnimal = AnimalModel(especie, urlFoto, urlAudio);
    _listAnimal.add(novoAnimal as AnimalController);
  }
}