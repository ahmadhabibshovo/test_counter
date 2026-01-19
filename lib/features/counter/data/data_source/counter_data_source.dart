import 'package:test_counter/features/counter/data/model/counter_model.dart';

abstract class CounterDataSource {
  Future<CounterModel> getCounter();
  Future<CounterModel> incrementCounter();
}
