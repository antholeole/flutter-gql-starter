import 'package:ferry/ferry.dart';
import 'package:ferry_hive_store/ferry_hive_store.dart';
import 'package:hive/hive.dart';

Future<Cache> buildCache({required bool memoryCache}) async {
  if (memoryCache) {
    return Cache(store: MemoryStore());
  } else {
    final box = await Hive.openBox('graphql');
    final store = HiveStore(box);
    return Cache(store: store);
  }
}
