abstract class Updater {
  Future checkUpdate();

  Future startDownload();

  Future install();
}
