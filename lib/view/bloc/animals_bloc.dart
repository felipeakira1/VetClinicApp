import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tempvet/domain/models/animal.dart';
import 'package:tempvet/repository/animal_repository.dart';
import 'package:tempvet/repository/guardian_repository.dart';

abstract class AnimalsEvents {}

class LoadAnimals extends AnimalsEvents {}

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
  }
}