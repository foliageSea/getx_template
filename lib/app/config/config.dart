import 'package:json_annotation/json_annotation.dart';

part 'config.g.dart';

@JsonSerializable()
class GlobalConfig {
  String? version;
  String? themeColor;
  bool? darkMode;

  GlobalConfig({
    this.version,
    this.themeColor,
    this.darkMode,
  });

  factory GlobalConfig.fromJson(Map<String, dynamic> json) =>
      _$GlobalConfigFromJson(json);

  Map<String, dynamic> toJson() => _$GlobalConfigToJson(this);

  @override
  String toString() {
    return 'GlobalConfig{version: $version, themeColor: $themeColor, darkMode: $darkMode}';
  }
}
