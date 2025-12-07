import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gogi_ordering_interface/models/menu_item_model.dart';
import 'package:gogi_ordering_interface/models/order_item_model.dart';
import 'package:gogi_ordering_interface/providers/session_provider.dart';
import 'package:gogi_ordering_interface/theme_data.dart';
import 'package:gogi_ordering_interface/widgets/icon_inkwell_button.dart';
import 'package:gogi_ordering_interface/widgets/tagged_text.dart';
import 'package:gogi_ordering_interface/widgets/menu_item_detail.dart';

class MenuItem extends StatelessWidget {
  final MenuItemModel menuItem;

  const MenuItem({
    required this.menuItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      menuItem.imagePath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        color: Theme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(0.8),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 80,
                              child: Text(
                                menuItem.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: clampDouble(
                                        MediaQuery.of(context).size.width *
                                            0.01,
                                        13,
                                        15,
                                      ),
                                    ),
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            TaggedText(
                              text:
                                  '\$${menuItem.unitPrice.toStringAsFixed(2)}',
                              backgroundColor: greenColor,
                            ),
                            const Expanded(child: SizedBox()),
                            ColorFiltered(
                              colorFilter: const ColorFilter.matrix([
                                -1, 0, 0, 0, 255, // Red
                                0, -1, 0, 0, 255, // Green
                                0, 0, -1, 0, 255, // Blue
                                0, 0, 0, 1, 0, // Alpha
                              ]),
                              child: Consumer<SessionProvider>(
                                  builder: (context, session, child) {
                                return IconInkwellButton(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MenuItemDetail(
                                        orderItem: session.currentOrder
                                                .containsKey(menuItem)
                                            ? session.currentOrder[menuItem]!
                                            : OrderItemModel(menuItem),
                                      ),
                                    ),
                                  ),
                                  icon:
                                      session.currentOrder.containsKey(menuItem)
                                          ? Icons.edit
                                          : Icons.add,
                                  iconSize: 17,
                                );
                              }),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
