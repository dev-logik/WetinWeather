import 'package:hive_ce/hive.dart';

class HiveLocalStorage<T> {
  final String _dataKey;
  late final Box<dynamic> _box;

  HiveLocalStorage._({required Box<dynamic> box, required dataKey})
    : _box = box,
      _dataKey = dataKey;

  static Future<HiveLocalStorage<T>> create<T>({
    required String boxName,
    required String dataKey,
  }) async {
    final box = await Hive.openBox<dynamic>(boxName);
    return HiveLocalStorage<T>._(box: box, dataKey: dataKey);
  }

  Future<void> cacheData({required List<T> data}) async =>
      await _box.put(_dataKey, data);

  Future<List<T>?> fetchData() async =>
      await _box.get(_dataKey)?.cast<T>().toList();

  bool isStorageEmpty() => _box.isEmpty;

  Future<void> dispose() async => await _box.close();
}
