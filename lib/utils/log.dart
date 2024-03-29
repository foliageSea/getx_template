import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;

import 'miru_directory.dart';
import 'miru_storage.dart';

final logger = Logger('Miru');

class MiruLog {
  static final logFilePath =
      path.join(MiruDirectory.getCacheDirectory, 'miru.log');

  static void ensureInitialized() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      final log =
          '${record.loggerName} ${record.level.name} ${record.time}: ${record.message} ${record.error ?? ''} ${record.stackTrace ?? ''}';
      // 如果是开发环境则打印到控制台
      if (kReleaseMode) {
        writeLogToFile(log);
        return;
      }

      debugPrint(log);
    });
  }

  // 写入日志到文件
  static void writeLogToFile(String log) {
    if (!MiruStorage.get(StorageKey.saveLog)) {
      return;
    }
    final file = File(logFilePath);
    file.writeAsStringSync('$log\n', mode: FileMode.append);
    if (file.lengthSync() > 1024 * 1024 * 10) {
      file.deleteSync();
    }
  }
}
