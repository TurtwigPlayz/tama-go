class MenuItemModel {
  final String _name;

  final String _imagePath;
  final double _unitPrice;
  final String _description;
  final int _defaultUnits;
  final List<String> _categories;
  final Map<String, List<String>> _dropdownOptions;
  final Map<String, bool> _defaultOptions;

  const MenuItemModel({
    required String name,
    required String imagePath,
    required double unitPrice,
    required String description,
    int defaultUnits = 1,
    List<String> categories = const <String>[],
    Map<String, bool> defaultOptions = const <String, bool>{},
    Map<String, List<String>> dropdownOptions = const <String, List<String>>{},
  })  : _name = name,
        _imagePath = imagePath,
        _unitPrice = unitPrice,
        _description = description,
        _defaultUnits = defaultUnits,
        _categories = categories,
        _dropdownOptions = dropdownOptions,
        _defaultOptions = defaultOptions;

  List<String> get categories => List.unmodifiable(_categories);
  Map<String, List<String>> get dropdownOptions =>
      Map.unmodifiable(_dropdownOptions);
  Map<String, bool> get defaultOptions => Map.unmodifiable(_defaultOptions);

  int get defaultUnits => _defaultUnits;
  String get description => _description;
  String get imagePath => _imagePath;

  String get name => _name;
  double get unitPrice => _unitPrice;
}
