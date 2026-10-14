import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/counter_local_data_source.dart';
import '../../data/repositories/counter_repository_impl.dart';
import '../../domain/entities/counter_entity.dart';
import '../../domain/repositories/counter_repository.dart';
import '../../domain/usecases/decrement_counter.dart';
import '../../domain/usecases/increment_counter.dart';

// Data Source Provider
final counterLocalDataSourceProvider = Provider<CounterLocalDataSource>((ref) {
  return CounterLocalDataSourceImpl();
});

// Repository Provider
final counterRepositoryProvider = Provider<CounterRepository>((ref) {
  final localDataSource = ref.watch(counterLocalDataSourceProvider);
  return CounterRepositoryImpl(localDataSource: localDataSource);
});

// UseCase Providers
final incrementCounterUseCaseProvider = Provider<IncrementCounter>((ref) {
  final repository = ref.watch(counterRepositoryProvider);
  return IncrementCounter(repository);
});

final decrementCounterUseCaseProvider = Provider<DecrementCounter>((ref) {
  final repository = ref.watch(counterRepositoryProvider);
  return DecrementCounter(repository);
});

// State Controller / Notifier
class CounterNotifier extends StateNotifier<CounterEntity> {
  final IncrementCounter _incrementCounter;
  final DecrementCounter _decrementCounter;

  CounterNotifier({
    required IncrementCounter incrementCounter,
    required DecrementCounter decrementCounter,
  })  : _incrementCounter = incrementCounter,
        _decrementCounter = decrementCounter,
        super(const CounterEntity(value: 0));

  Future<void> increment() async {
    final result = await _incrementCounter(state.value);
    state = result;
  }

  Future<void> decrement() async {
    final result = await _decrementCounter(state.value);
    state = result;
  }
}

// Counter State Provider
final counterProvider =
    StateNotifierProvider<CounterNotifier, CounterEntity>((ref) {
  final incrementUseCase = ref.watch(incrementCounterUseCaseProvider);
  final decrementUseCase = ref.watch(decrementCounterUseCaseProvider);
  return CounterNotifier(
    incrementCounter: incrementUseCase,
    decrementCounter: decrementUseCase,
  );
});
