import 'package:get_storage/get_storage.dart';
import 'package:test_counter/features/counter/data/data_source/counter_data_source.dart';
import 'package:test_counter/features/counter/data/model/counter_model.dart';

class CounterLocalDataSourceImpl extends CounterDataSource {
  final GetStorage storage;
  static const String counterKey = 'counter';

  CounterLocalDataSourceImpl(this.storage);

  @override
  Future<CounterModel> getCounter() async {
    try {
      final json = storage.read(counterKey);
      if (json != null) {
        return CounterModel.fromJson(json as Map<String, dynamic>);
      }
      return CounterModel(value: 0);
    } catch (e) {
      return CounterModel(value: 0);
    }
  }

  @override
  Future<CounterModel> incrementCounter() async {
    try {
      final currentJson = storage.read(counterKey);
      int currentValue = 0;

      if (currentJson != null) {
        currentValue = (currentJson as Map<String, dynamic>)['value'] ?? 0;
      }

      final newValue = currentValue + 1;
      final newCounter = CounterModel(value: newValue);

      await storage.write(counterKey, newCounter.toJson());

      return newCounter;
    } catch (e) {
      return CounterModel(value: 0);
    }
  }
}
