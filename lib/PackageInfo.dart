import 'dart:async' show Future;
import 'package:package_info/package_info.dart';

class PackageInfoUtil {
  static PackageInfo _packageInfo;

  static Future<PackageInfo> get _instance async =>
      _packageInfo ??= await PackageInfo.fromPlatform();

  static Future<PackageInfo> init() async {
    print("init");
    _packageInfo = await _instance;
    return _packageInfo;
  }

  String getAppVersion() => _packageInfo.version;
}
