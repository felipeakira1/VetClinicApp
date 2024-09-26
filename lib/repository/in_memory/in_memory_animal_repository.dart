import 'package:tempvet/domain/models/animal.dart';
import 'package:tempvet/repository/animal_repository.dart';

class InMemoryAnimalRepository implements AnimalRepository {
  final List<Animal> _animals = [
    Animal(id: 1, name: 'Ares', species: 'Cat', breed: 'Normal', age: 4, gender: 'Masculino', ownerId: 1),
  ];

  @override
  Future<void> createAnimal(Animal appointment) async {
    _animals.add(appointment);
  }

  @override
  Future<List<Animal>> fetchAnimals() async {
    return Future.value(_animals);
  }

  @override
  Future<Animal> fetchAnimalById(int id) async {
    return Future.value(_animals.firstWhere((appointmnet) => appointmnet.id == id));
  }
}