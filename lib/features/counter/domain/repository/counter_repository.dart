import 'package:test_counter/features/counter/domain/entities/counter_entity.dart';

abstract class CounterRepository {
  Future<CounterEntity> getCounter();
  Future<CounterEntity> incrementCounter();
}
