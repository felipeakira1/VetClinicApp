import 'package:tempvet/domain/models/veterinarian.dart';

abstract class VeterinarianRepository {
  Future<void> createVeterinarian(Veterinarian veterinarian);
  Future<List<Veterinarian>> retrieveAllVeterinarians();
  Future<Veterinarian> retrieveVeterinarianById(int id);
}