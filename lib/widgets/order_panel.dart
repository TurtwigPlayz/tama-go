import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:gogi_ordering_interface/widgets/modals/confirmation_modal.dart';
import 'package:gogi_ordering_interface/widgets/modals/message_modal.dart';
import 'package:gogi_ordering_interface/theme_data.dart';
import 'package:gogi_ordering_interface/providers/session_provider.dart';
import 'package:gogi_ordering_interface/widgets/inkwell_button.dart';
import 'package:gogi_ordering_interface/widgets/order_item.dart';
import 'package:gogi_ordering_interface/widgets/tagged_text.dart';

class OrderPanel extends StatefulWidget {
  const OrderPanel({super.key});

  @override
  State<OrderPanel> createState() => _OrderPanelState();
}

class _OrderPanelState extends State<OrderPanel> {
  bool _isViewingOrderHistory = false;

  void _toggleView() {
    setState(() {
      _isViewingOrderHistory = !_isViewingOrderHistory;
    });
  }

  Widget _buildTotalCostTag(BuildContext context, String text, double cost) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Material(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10.0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Text(
                    text,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: clampDouble(
                              MediaQuery.of(context).size.width * 0.01, 13, 17),
                        ),
                  ),
                  const Expanded(child: SizedBox()),
                  TaggedText(
                      text: '\$${cost.toStringAsFixed(2)}',
                      backgroundColor: greenColor),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyListMessage(
      BuildContext context, String message, IconData icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 20.0),
        Icon(icon, size: 50.0, color: Theme.of(context).cardColor),
        const SizedBox(height: 10.0),
        Text(
          message,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).cardColor,
                fontSize: 17.0,
              ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    const double itemSpacing = 10.0;

    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: Theme.of(context).cardColor, width: 1),
        ),
      ),
      width: 300.0,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Consumer<SessionProvider>(
          builder: (context, session, child) => Column(
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      if (!_isViewingOrderHistory)
                        if (session.currentOrder.values.isNotEmpty)
                          ...session.currentOrder.values.expand((item) {
                            return <Widget>[
                              OrderItem(model: item),
                              const SizedBox(
                                height: itemSpacing,
                              ),
                            ];
                          })
                        else
                          _buildEmptyListMessage(
                              context,
                              'Order is currently empty.',
                              Icons.add_shopping_cart)
                      else if (session.orderHistory.isNotEmpty)
                        ...session.orderHistory.reversed
                            .toList()
                            .asMap()
                            .entries
                            .expand((entry) {
                          final index = entry.key;
                          final historicalItems = entry.value;
                          final historicalDate = session
                              .orderHistoryDates.reversed
                              .toList()[index];
                          final formattedTime =
                              DateFormat('hh:mm a').format(historicalDate);

                          return <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Divider(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .color,
                                    thickness: 1.0,
                                    endIndent: 8.0,
                                  ),
                                ),
                                Text(
                                  formattedTime,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: clampDouble(
                                            MediaQuery.of(context).size.width *
                                                0.01,
                                            12,
                                            16),
                                      ),
                                ),
                                Expanded(
                                  child: Divider(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .color,
                                    thickness: 1.0,
                                    indent: 8.0,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            ...historicalItems.expand((item) => <Widget>[
                                  OrderItem(
                                    model: item,
                                    isHistorical: true,
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                ]),
                          ];
                        })
                      else
                        _buildEmptyListMessage(context, 'No orders placed yet.',
                            Icons.shopping_cart_outlined),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              _buildTotalCostTag(
                  context, 'Current Order Cost', session.orderTotalCost),
              const SizedBox(height: 10.0),
              _buildTotalCostTag(
                  context, 'Total Order Cost', session.currentTotalCost),
              const SizedBox(height: 20.0),
              if (!_isViewingOrderHistory)
                InkwellButton(
                  onTap: () => _toggleView(),
                  title: 'Order History',
                  icon: Icons.history,
                )
              else
                InkwellButton(
                  onTap: _toggleView,
                  title: 'Back To Order',
                  icon: Icons.arrow_back,
                ),
              const SizedBox(height: 10.0),
              InkwellButton(
                onTap: () => showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) => ConfirmationModal(
                    title: 'Order Confirmation',
                    message:
                        'Are you sure you want to place this order? This action cannot be undone.',
                    onConfirm: () => {
                      session.moveOrderToHistory(),
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => const MessageModal(
                          message:
                              'Your order has been placed. A waiter will be with you soon.',
                        ),
                      ),
                    },
                  ),
                ),
                title: 'Place Order',
                icon: Icons.shopping_cart_checkout,
                isDisabled: session.currentOrder.isEmpty,
                disabledMessage:
                    'Your order is currently empty. Please add items to your order.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
