import 'package:test_counter/features/counter/data/data_source/counter_data_source.dart';
import 'package:test_counter/features/counter/domain/entities/counter_entity.dart';
import 'package:test_counter/features/counter/domain/repository/counter_repository.dart';

class CounterRepositotyImpl extends CounterRepository {
  CounterRepositotyImpl(this.counterDataSource);
  final CounterDataSource counterDataSource;
  @override
  Future<CounterEntity> getCounter() {
    return counterDataSource.getCounter();
  }

  @override
  Future<CounterEntity> incrementCounter() {
    return counterDataSource.incrementCounter();
  }
}
