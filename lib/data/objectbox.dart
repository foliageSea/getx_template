import 'package:getx_template/app/utils/log.dart';
import 'package:getx_template/objectbox.g.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'models/note.dart';

// 全局 ObjectBox
late ObjectBox objectBox;

class ObjectBox {
  late final Store _store;

  late final Box<Note> _noteBox;

  ObjectBox._create(this._store) {
    _noteBox = Box<Note>(_store);
  }

  static Future<ObjectBox> create() async {
    var dir = await getApplicationDocumentsDirectory();
    talker.info("🛸ObjectBox Dir: ${dir.path}");
    final store = await openStore(
        directory: p.join((dir).path, "obx-demo"),
        macosApplicationGroup: "objectbox.demo");
    return ObjectBox._create(store);
  }

  Stream<List<Note>> getNotes() {
    final builder = _noteBox.query().order(Note_.date, flags: Order.descending);
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

  Future<void> addNote(String text) => _noteBox.putAsync(Note(text));

  Future<void> removeNote(int id) => _noteBox.removeAsync(id);
}
