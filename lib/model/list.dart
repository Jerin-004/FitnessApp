final String tableList = 'List';

class ListFields {
  static final List<String> values = [
    /// Add all fields
    equipment, weight, reps, time
  ];

  static final String equipment = '_equipment';
  static final String weight = 'weight';
  static final String reps = 'reps';
  static final String time = 'time';
}

class modelList {
  final String equipment;
  final int weight;
  final int reps;
  final DateTime createdTime;

  const modelList({
    required this.equipment,
    required this.weight,
    required this.reps,
    required this.createdTime,
  });

  modelList copy({
    String? equipment,
    int? weight,
    int? reps,
    DateTime? createdTime,
  }) =>
      modelList(
        equipment: equipment ?? this.equipment,
        weight: weight ?? this.weight,
        reps: reps ?? this.reps,
        createdTime: createdTime ?? this.createdTime,
      );

  static modelList fromJson(Map<String, Object?> json) => modelList(
    equipment: json[ListFields.equipment] as String,
    weight: json[ListFields.weight] as int,
    reps: json[ListFields.reps] as int,
    createdTime: DateTime.parse(json[ListFields.time] as String),
  );

  Map<String, Object?> toJson() => {
    ListFields.equipment: equipment,
    ListFields.weight: weight,
    ListFields.reps: reps,
    ListFields.time: createdTime.toIso8601String(),
  };

}