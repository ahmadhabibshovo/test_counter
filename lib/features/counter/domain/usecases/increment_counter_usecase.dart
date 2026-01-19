import 'package:test_counter/features/counter/domain/entities/counter_entity.dart';
import 'package:test_counter/features/counter/domain/repository/counter_repository.dart';

class IncrementCounterUsecase {
  final CounterRepository repository;
  IncrementCounterUsecase(this.repository);

  Future<CounterEntity> call() {
    return repository.incrementCounter();
  }
}
