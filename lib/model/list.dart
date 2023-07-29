class ModelList {
  int? id;
  String? equipment;
  int? weight;
  int? reps;
  String? date;

  listMap() {
    var mapping = Map<String, dynamic>();
      mapping['id'] = id ?? null;
      mapping['equipment'] = equipment!;
      mapping['weight'] = weight!;
      mapping['reps'] = reps!;
      mapping['date'] = date!;
      return mapping;
  }
}