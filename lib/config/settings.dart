
class Settings {
  factory Settings() {
    if (_this == null) {
      throw Exception('Must initialize settings');
    }
    return _this!;
  }

  Settings.initialize({
    required this.settingsMap,
  }) {
    _this = this;
  }

  final Map<String, String> settingsMap;

  static Settings? _this;

  static bool get isInitialized => _this != null;

  String get apiUrl {
    final apiUrl = settingsMap['API_URL'];
    if (apiUrl != null) {
      return apiUrl;
    }
    throw Exception('API_URL not found in settings');
  }

}

