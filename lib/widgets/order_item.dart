import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gogi_ordering_interface/widgets/icon_inkwell_button.dart';
import 'package:gogi_ordering_interface/widgets/menu_item_detail.dart';
import 'package:provider/provider.dart';
import 'package:gogi_ordering_interface/widgets/tagged_text.dart';
import 'package:gogi_ordering_interface/models/order_item_model.dart';
import 'package:gogi_ordering_interface/theme_data.dart';
import 'package:gogi_ordering_interface/providers/session_provider.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.model,
    this.isHistorical = false,
  });

  final OrderItemModel model;
  final bool isHistorical;

  Widget _buildItemOptionRow(
      String title, String value, Color color, BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: clampDouble(
                    MediaQuery.of(context).size.width * 0.01, 13, 16),
              ),
        ),
        const Expanded(child: SizedBox()),
        TaggedText(
          text: value,
          backgroundColor: color,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius = BorderRadius.circular(10.0);
    final session = Provider.of<SessionProvider>(context, listen: false);

    return Material(
      color: Theme.of(context).cardColor,
      borderRadius: borderRadius,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 110,
                          child: Text(
                            model.menuItem.name,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: clampDouble(
                                    MediaQuery.of(context).size.width * 0.01,
                                    14,
                                    17,
                                  ),
                                ),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        TaggedText(
                            text: 'x${model.quantity}',
                            backgroundColor: blueColor),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    TaggedText(
                        text: '\$${model.cost.toStringAsFixed(2)}',
                        backgroundColor: greenColor),
                  ],
                ),
                if (!isHistorical) ...<Widget>[
                  const Expanded(child: SizedBox()),
                  IconInkwellButton(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MenuItemDetail(
                          orderItem: model,
                        ),
                      ),
                    ),
                    icon: Icons.edit,
                  ),
                  const SizedBox(width: 8.0),
                  IconInkwellButton(
                    onTap: () => session.removeFromOrder(model.menuItem),
                    icon: Icons.delete,
                    splashColor: redColor,
                  ),
                ],
              ],
            ),
            if (model.options.isNotEmpty ||
                model.dropdownOptions.isNotEmpty) ...<Widget>[
              const SizedBox(height: 9.0),
              for (final option in model.options.entries) ...<Widget>[
                _buildItemOptionRow(
                  option.key,
                  option.value ? 'Yes' : 'No',
                  option.value ? greenColor : redColor,
                  context,
                ),
                const SizedBox(height: 8.0),
              ],
              for (final dropdown in model.dropdownOptions.entries) ...<Widget>[
                _buildItemOptionRow(
                  dropdown.key,
                  model.dropdownSelections[dropdown.key] ?? 'Unknown',
                  blueColor,
                  context,
                ),
                const SizedBox(height: 8.0),
              ],
            ],
          ],
        ),
      ),
    );
  }
}
