import 'package:flutter/material.dart';
import 'package:test_counter/features/counter/domain/entities/counter_entity.dart';
import 'package:test_counter/features/counter/domain/usecases/get_counter_usecase.dart';
import 'package:test_counter/features/counter/domain/usecases/increment_counter_usecase.dart';

class CounterProvider extends ChangeNotifier {
  final GetCounterUseCase getCounterUseCase;
  final IncrementCounterUsecase incrementCounterUseCase;
  CounterProvider({
    required this.getCounterUseCase,
    required this.incrementCounterUseCase,
  });

  bool isLoading = false;
  String? error;

  CounterEntity? _count;

  CounterEntity get count => _count ?? CounterEntity(value: 0);

  Future<void> initCounter() async {
    _count = await getCounterUseCase.call();
    notifyListeners();
  }

  Future<void> increment() async {
    _count = await incrementCounterUseCase.call();
    notifyListeners();
  }
}
