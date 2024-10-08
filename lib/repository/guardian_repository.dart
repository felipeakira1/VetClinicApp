

import 'package:tempvet/domain/models/guardian.dart';

abstract class GuardianRepository {
  Future<void> createGuardian(Guardian guardian);
  Future<List<Guardian>> retrieveAllGuardians();
  Future<Guardian> retrieveGuardianById(int id);
}