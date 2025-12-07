import 'dart:math';
import 'menu_item_model.dart';

class OrderItemModel {
  OrderItemModel._internalConstructor({
    required MenuItemModel menuItem,
    required int quantity,
    required Map<String, List<String>> dropdownOptions,
    required Map<String, bool> options,
  })  : _options = options,
        _dropdownOptions = dropdownOptions,
        _dropdownSelections = dropdownOptions.map(
          (key, value) => MapEntry(key, value.first),
        ),
        _quantity = quantity,
        _menuItem = menuItem;

  final MenuItemModel _menuItem;
  int _quantity;

  Map<String, String> _dropdownSelections;
  Map<String, List<String>> _dropdownOptions;
  Map<String, bool> _options;

  MenuItemModel get menuItem => _menuItem;
  int get quantity => _quantity;

  Map<String, String> get dropdownSelections => _dropdownSelections;
  Map<String, List<String>> get dropdownOptions => _dropdownOptions;
  Map<String, bool> get options => _options;

  double get cost => _quantity * _menuItem.unitPrice;

  void updateQuantity(int amount) {
    _quantity = max(0, _quantity + amount);
  }

  set quantity(int value) {
    _quantity = value;
  }

  factory OrderItemModel(MenuItemModel menuItem) {
    return OrderItemModel._internalConstructor(
      menuItem: menuItem,
      quantity: menuItem.defaultUnits,
      dropdownOptions:
          Map.from(menuItem.dropdownOptions), // Copy the dropdown options
      options: Map.from(menuItem.defaultOptions), // Copy the default options
    );
  }
}
