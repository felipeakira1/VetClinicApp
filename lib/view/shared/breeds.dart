class Breeds {
  static const List<String> species = [
    'Cachorro',
    'Gato'
  ];

  static const Map<String, List<String>> _breeds = {
    'Cachorro': ['Vira-lata', 'Poodle', 'Pitbull', 'Pastor alemão'],
    'Gato': ['Sem raça definida (SRD)', 'Persa', 'Siamês'],
  };

  static List<String> getBreeds(String species) {
    return _breeds[species] ?? [];
  }
}