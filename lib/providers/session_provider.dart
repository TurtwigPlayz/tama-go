import 'package:flutter/material.dart';
import 'package:gogi_ordering_interface/models/menu_item_model.dart';
import 'package:gogi_ordering_interface/models/order_item_model.dart';

class SessionProvider extends ChangeNotifier {
  SessionProvider._internalConstructor({
    required Map<MenuItemModel, OrderItemModel> currentOrder,
    required List<List<OrderItemModel>> orderHistory,
    required List<DateTime> orderHistoryDates,
    required List<MenuItemModel> menuItems,
    required List<String> menuCategories,
  })  : _currentOrder = currentOrder,
        _orderHistory = orderHistory,
        _orderHistoryDates = orderHistoryDates,
        _menuItems = menuItems,
        _menuCategories = menuCategories;

  final Map<MenuItemModel, OrderItemModel> _currentOrder;
  final List<List<OrderItemModel>> _orderHistory;
  final List<DateTime> _orderHistoryDates;
  final List<MenuItemModel> _menuItems;
  final List<String> _menuCategories;

  factory SessionProvider(
      List<MenuItemModel> menuItems, List<String> menuCategories) {
    return SessionProvider._internalConstructor(
      currentOrder: {},
      orderHistory: [],
      orderHistoryDates: [],
      menuItems: menuItems,
      menuCategories: menuCategories,
    );
  }

  void addToOrder(MenuItemModel menuItem) {
    if (_currentOrder[menuItem] != null) {
      _currentOrder[menuItem]!.updateQuantity(1);
    } else {
      _currentOrder[menuItem] = OrderItemModel(menuItem);
    }

    notifyListeners();
  }

  void updateOrder(OrderItemModel orderItem, int quantity) {
    if (_currentOrder[orderItem.menuItem] != null) {
      _currentOrder[orderItem.menuItem]!.quantity = quantity;
    } else {
      _currentOrder[orderItem.menuItem] = orderItem;
    }

    notifyListeners();
  }

  void removeFromOrder(MenuItemModel menuItem) {
    _currentOrder.remove(menuItem);

    notifyListeners();
  }

  void moveOrderToHistory() {
    _orderHistory.add(_currentOrder.values.toList());
    _orderHistoryDates.add(DateTime.now());
    _currentOrder.clear();

    notifyListeners();
  }

  Map<MenuItemModel, OrderItemModel> get currentOrder =>
      Map.unmodifiable(_currentOrder);
  List<List<OrderItemModel>> get orderHistory =>
      List.unmodifiable(_orderHistory);
  List<DateTime> get orderHistoryDates => List.unmodifiable(_orderHistoryDates);

  List<MenuItemModel> get menuItems => List.unmodifiable(_menuItems);
  List<String> get menuCategories => List.unmodifiable(_menuCategories);

  double get orderTotalCost =>
      _currentOrder.values.fold(0, (acc, orderItem) => acc + orderItem.cost);
  double get currentTotalCost => _orderHistory.fold(
      0,
      (acc, historicalItems) =>
          acc +
          historicalItems.fold(0, (acc, orderItem) => acc + orderItem.cost));
}
