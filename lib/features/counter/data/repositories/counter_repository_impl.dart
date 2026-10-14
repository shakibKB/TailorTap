import '../../domain/entities/counter_entity.dart';
import '../../domain/repositories/counter_repository.dart';
import '../datasources/counter_local_data_source.dart';

class CounterRepositoryImpl implements CounterRepository {
  final CounterLocalDataSource localDataSource;

  CounterRepositoryImpl({required this.localDataSource});

  @override
  Future<CounterEntity> getCounter() async {
    final value = await localDataSource.getCounterValue();
    return CounterEntity(value: value);
  }

  @override
  Future<CounterEntity> increment(int current) async {
    final newValue = current + 1;
    await localDataSource.saveCounterValue(newValue);
    return CounterEntity(value: newValue);
  }

  @override
  Future<CounterEntity> decrement(int current) async {
    final newValue = current - 1;
    await localDataSource.saveCounterValue(newValue);
    return CounterEntity(value: newValue);
  }
}
