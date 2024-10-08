import 'package:tempvet/domain/models/veterinarian.dart';
import 'package:tempvet/repository/veterinarian_repository.dart';

class InMemoryVeterinarianRepository implements VeterinarianRepository {
    final List<Veterinarian> _veterinarians = [
        Veterinarian(id: 1, name: 'Dr. John Doe', address: 'Rua dos veterinarios 1', cpf: '111.222.333-44', crmv: '1234'),
    ];
    
    @override
    Future<void> createVeterinarian(Veterinarian veterinarian) async {
        _veterinarians.add(veterinarian);
    }

    @override
    Future<List<Veterinarian>> retrieveAllVeterinarians() async {
        return _veterinarians;
    }

    @override
    Future<Veterinarian> retrieveVeterinarianById(int id) async {
        return _veterinarians.firstWhere((veterinarian) => veterinarian.id == id);
    }
}