import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tempvet/domain/models/animal.dart';
import 'package:tempvet/domain/models/guardian.dart';
import 'package:tempvet/repository/animal_repository.dart';
import 'package:tempvet/repository/guardian_repository.dart';

abstract class GuardiansEvents {}

class LoadGuardians extends GuardiansEvents {}

abstract class GuardiansStates {}

class GuardianLoading extends GuardiansStates {}

class GuardiansLoaded extends GuardiansStates {
  final List<Guardian> guardians;

  GuardiansLoaded({required this.guardians});
}

class GuardiansError extends GuardiansStates {
  final String message;

  GuardiansError({required this.message});
}

class GuardiansBloc extends Bloc<GuardiansEvents, GuardiansStates> {
  final AnimalRepository _animalRepository;
  final GuardianRepository _guardianRepository;
  
  GuardiansBloc(this._animalRepository, this._guardianRepository) : super(GuardianLoading()) {
    on<LoadGuardians>((event, emit) async {
      emit(GuardianLoading());
      try {
        final List<Guardian> guardians = await _guardianRepository.retrieveAllGuardians();
        for(Guardian guardian in guardians) {
          guardian.animais = await _animalRepository.fetchAnimalsByGuardianId(guardian.id!);
        }
        emit(GuardiansLoaded(guardians: guardians));
      } catch(e) {
        emit(GuardiansError(message: e.toString()));
      }
    });
  }

}