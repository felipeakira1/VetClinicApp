import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tempvet/domain/models/animal.dart';
import 'package:tempvet/repository/animal_repository.dart';
import 'package:tempvet/repository/guardian_repository.dart';

abstract class AnimalsEvents {}

class LoadAnimals extends AnimalsEvents {}

class AddAnimal extends AnimalsEvents {
  final Animal animal;

  AddAnimal({required this.animal});
}

abstract class AnimalsStates {}

class AnimalsLoading extends AnimalsStates {}

class AnimalsLoaded extends AnimalsStates {
  final List<Animal> animals;

  AnimalsLoaded({required this.animals});
}

class AnimalsError extends AnimalsStates {
  final String message;

  AnimalsError({required this.message});
}

class AnimalAdded extends AnimalsStates {}

class AnimalsBloc extends Bloc<AnimalsEvents, AnimalsStates> {
  final AnimalRepository _animalRepository;
  final GuardianRepository _guardianRepository;
  
  AnimalsBloc(this._animalRepository, this._guardianRepository) : super(AnimalsLoading()) {
    on<LoadAnimals>((event, emit) async {
      emit(AnimalsLoading());
      try {
        final List<Animal> animals = await _animalRepository.fetchAnimals();
        for(Animal animal in animals) {
          animal.guardian = await _guardianRepository.retrieveGuardianById(animal.guardianId);
        }
        emit(AnimalsLoaded(animals: animals));
      } catch(e) {
        emit(AnimalsError(message: e.toString()));
      }
    });
    on<AddAnimal>((event, emit) async{
      emit(AnimalsLoading());
      try {
        await _animalRepository.createAnimal(event.animal);
        emit(AnimalAdded());
      } catch(e) {
        emit(AnimalsError(message: e.toString()));
      }
    });
  }

}