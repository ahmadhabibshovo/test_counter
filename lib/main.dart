import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:test_counter/features/counter/data/data_source/counter_data_source.dart';
import 'package:test_counter/features/counter/data/data_source/counter_local_datasource.dart';
import 'package:test_counter/features/counter/data/repository/counter_repository_impl.dart';
import 'package:test_counter/features/counter/domain/repository/counter_repository.dart';
import 'package:test_counter/features/counter/domain/usecases/get_counter_usecase.dart';
import 'package:test_counter/features/counter/domain/usecases/increment_counter_usecase.dart';
import 'package:test_counter/features/counter/presentaion/pages/counter_page.dart';
import 'package:test_counter/features/counter/presentaion/provider/counter_provider.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    CounterDataSource counterDataSource = CounterLocalDataSourceImpl(
      GetStorage(),
    );

    CounterRepository counterRepositoryImpl = CounterRepositotyImpl(
      counterDataSource,
    );
    GetCounterUseCase getCounterUseCase = GetCounterUseCase(
      counterRepositoryImpl,
    );
    IncrementCounterUsecase incrementCounterUseCase = IncrementCounterUsecase(
      counterRepositoryImpl,
    );

    return ChangeNotifierProvider<CounterProvider>(
      create: (context) => CounterProvider(
        getCounterUseCase: getCounterUseCase,
        incrementCounterUseCase: incrementCounterUseCase,
      ),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const CounterPage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
