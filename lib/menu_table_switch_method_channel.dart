import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'menu_table_switch_platform_interface.dart';

/// An implementation of [MenuTableSwitchPlatform] that uses method channels.
class MethodChannelMenuTableSwitch extends MenuTableSwitchPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('menu_table_switch');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
