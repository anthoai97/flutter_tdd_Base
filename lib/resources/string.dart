class StringDef {
  static StringDef? _instance;

  StringDef._();

  static StringDef get instance {
    if (_instance == null) {
      _instance = StringDef._();
    }

    return _instance!;
  }

  late final String noContentFound = 'noContentFound';
}
