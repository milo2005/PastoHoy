import 'package:injectable/injectable.dart';
import 'package:objectbox/objectbox.dart';

import '../entities/plan_entity.dart';

@LazySingleton()
final class PlanDao {
  final Store _store;
  late final Box<PlanEntity> _box = _store.box();

  PlanDao(this._store);

  Future insertMany(List<PlanEntity> plans) {
    return _box.putManyAsync(plans);
  }

  Stream<List<PlanEntity>> listen(){
    return _box.query()
        .watch()
        .map((event) => event.find());
  }
}