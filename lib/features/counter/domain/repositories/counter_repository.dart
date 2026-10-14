import '../entities/counter_entity.dart';

abstract class CounterRepository {
  Future<CounterEntity> getCounter();
  Future<CounterEntity> increment(int current);
  Future<CounterEntity> decrement(int current);
}
