import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseRemoteConfigService {
  /// Create singleton, so only one service is ever created
  FirebaseRemoteConfigService._() : _remoteConfig = FirebaseRemoteConfig.instance;

  static FirebaseRemoteConfigService? _instance;
  factory FirebaseRemoteConfigService() => _instance ??= FirebaseRemoteConfigService._();

  final FirebaseRemoteConfig _remoteConfig;

  /// used to fetch a [String] from [FirebaseRemoteConfig]
  String getString(String key) => _remoteConfig.getString(key);

  /// setup default settings
  Future<void> _setConfigSettings() async => _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(minutes: 1),
          minimumFetchInterval: const Duration(hours: 12),
        ),
      );

  /// setup defaults
  Future<void> _setDefaults() async => _remoteConfig.setDefaults(
        {
          'api_key': '',
          'base_url': '',
        },
      );

  /// Fetch and active the [FirebaseRemoteConfig]
  Future<void> fetchAndActivate() async {
    bool updated = await _remoteConfig.fetchAndActivate();

    if (updated) {
      print('The config has been updated.');
    } else {
      print('The config is not updated.');
    }
  }

  /// Initialize the [FirebaseRemoteConfig] service
  Future<void> initialize() async {
    await _setConfigSettings();
    await _setDefaults();
    await fetchAndActivate();
  }
}
