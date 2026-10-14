abstract class CounterLocalDataSource {
  Future<int> getCounterValue();
  Future<int> saveCounterValue(int value);
}

class CounterLocalDataSourceImpl implements CounterLocalDataSource {
  int _value = 0;

  @override
  Future<int> getCounterValue() async {
    return _value;
  }

  @override
  Future<int> saveCounterValue(int value) async {
    _value = value;
    return _value;
  }
}
