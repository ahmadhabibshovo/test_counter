import 'package:test_counter/features/counter/domain/entities/counter_entity.dart';

class CounterModel extends CounterEntity {
  CounterModel({required super.value});

  factory CounterModel.fromEntity(CounterEntity entity) {
    return CounterModel(value: entity.value);
  }
  CounterEntity toEntity() {
    return CounterEntity(value: value);
  }

  factory CounterModel.fromJson(Map<String, dynamic> json) {
    return CounterModel(value: json["value"]);
  }
  Map<String, dynamic> toJson() {
    return {'value': value};
  }
}
