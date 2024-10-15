import 'package:tempvet/domain/models/animal.dart';

abstract class AnimalRepository {
  Future<void> createAnimal(Animal animal);
  Future<List<Animal>> fetchAnimals();
  Future<Animal> fetchAnimalById(int id);
  Future<List<Animal>> fetchAnimalsByGuardianId(int guardianId);
}