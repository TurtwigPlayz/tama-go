import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gogi_ordering_interface/models/order_item_model.dart';
import 'package:gogi_ordering_interface/providers/session_provider.dart';
import 'package:gogi_ordering_interface/theme_data.dart';
import 'package:gogi_ordering_interface/widgets/inkwell_button.dart';
import 'package:gogi_ordering_interface/widgets/tagged_text.dart';

class MenuItemDetail extends StatefulWidget {
  final OrderItemModel orderItem;

  const MenuItemDetail({
    required this.orderItem,
    super.key,
  });

  @override
  MenuItemDetailState createState() => MenuItemDetailState();
}

class MenuItemDetailState extends State<MenuItemDetail> {
  @override
  Widget build(BuildContext context) {
    const double borderRadius = 12.0;
    final session = Provider.of<SessionProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          widget.orderItem.menuItem.name,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: clampDouble(
                    MediaQuery.of(context).size.width * 0.01, 18, 24),
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  widget.orderItem.menuItem.imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 250.0,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                widget.orderItem.menuItem.name,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: clampDouble(
                          MediaQuery.of(context).size.width * 0.01, 18, 24),
                    ),
              ),
              const SizedBox(height: 8.0),
              Align(
                alignment: Alignment.centerLeft,
                child: TaggedText(
                  text: '\$${widget.orderItem.cost.toStringAsFixed(2)}',
                  backgroundColor: greenColor,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                widget.orderItem.menuItem.description,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: clampDouble(
                          MediaQuery.of(context).size.width * 0.01, 14, 18),
                    ),
              ),
              const SizedBox(height: 24.0),
              ...widget.orderItem.dropdownOptions.entries.map((entry) {
                final title = entry.key;
                final options = entry.value;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: clampDouble(
                                MediaQuery.of(context).size.width * 0.01,
                                14,
                                18),
                          ),
                    ),
                    DropdownButton<String>(
                      borderRadius: BorderRadius.circular(borderRadius),
                      value: widget.orderItem.dropdownSelections[title],
                      items: options.map((option) {
                        return DropdownMenuItem(
                          value: option,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              option,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: clampDouble(
                                        MediaQuery.of(context).size.width *
                                            0.01,
                                        14,
                                        18),
                                  ),
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          widget.orderItem.dropdownSelections[title] =
                              newValue!;
                        });
                      },
                    ),
                    const SizedBox(height: 16.0),
                  ],
                );
              }),
              ...widget.orderItem.options.entries.map((entry) {
                final title = entry.key;
                final value = entry.value;
                return CheckboxListTile(
                  title: Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: clampDouble(
                              MediaQuery.of(context).size.width * 0.01, 14, 18),
                        ),
                  ),
                  value: value,
                  onChanged: (newValue) {
                    setState(() {
                      widget.orderItem.options[title] = newValue!;
                    });
                  },
                  fillColor: WidgetStateProperty.resolveWith<Color?>(
                    (Set<WidgetState> states) {
                      if (states.contains(WidgetState.selected)) {
                        return greenColor;
                      }
                      return null;
                    },
                  ),
                  checkColor: Colors.white,
                );
              }),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Quantity",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: clampDouble(
                              MediaQuery.of(context).size.width * 0.01, 14, 18),
                        ),
                  ),
                  Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          if (widget.orderItem.quantity == 1) {
                            return;
                          }

                          setState(() {
                            widget.orderItem.updateQuantity(-1);
                          });
                        },
                        icon: const Icon(Icons.remove),
                      ),
                      Text(
                        widget.orderItem.quantity.toString(),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: clampDouble(
                                  MediaQuery.of(context).size.width * 0.01,
                                  16,
                                  20),
                            ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            widget.orderItem.updateQuantity(1);
                          });
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              InkwellButton(
                onTap: () {
                  session.updateOrder(
                      widget.orderItem, widget.orderItem.quantity);
                  Navigator.pop(context); // Return to the previous page
                },
                title: "Save",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
