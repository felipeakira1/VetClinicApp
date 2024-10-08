

import 'package:tempvet/domain/models/guardian.dart';
import 'package:tempvet/repository/guardian_repository.dart';

class InMemoryGuardianRepository implements GuardianRepository {
  final List<Guardian> _guardians = [
    Guardian(id: 1, name: "Felipe Akira Nozaki", address: "Rua Estudante 578", cpf: "405.100.378-79"),
  ];

  @override
  Future<void> createGuardian(Guardian guardian) async {
    _guardians.add(guardian);
  }

  @override
  Future<List<Guardian>> retrieveAllGuardians() async {
    return Future.value(_guardians);
  }

  @override
  Future<Guardian> retrieveGuardianById(int id) async {
    return Future.value(_guardians.firstWhere((guardian) => guardian.id == id));
  }
}