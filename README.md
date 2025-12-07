# Gogi Ordering Interface

> Final project for **CPSC 481, Group 3, Tutorial 4**!

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)

## Credit

This software was developed and tested by:

- Connell Reffo (connell.reffo@ucalgary.ca)
- Creek Thompson (nelson.thompson@ucalgary.ca)
- Hamza Khan (hamza.khan3@ucalgary.ca)
- Thevin Mahawatte (thevin.mahawatte@ucalgary.ca)

## Run development environment

1. Install Flutter SDK. This can be done directly through VSCode using the Flutter extension.

2. Ensure a **Chrome** based browser is installed (**Microsoft Edge**, **Chrome**, **Chromium** works). A Chrome based browser is required to connect to the Flutter Web SDK service.

3. In the root of this project (same level as `pubspec.yaml`), run:

```bash
flutter run
```

## Deployment

This project is deployed on **GitHub Pages** here: https://connellr023.github.io/gogi-ordering-interface/

## Usage of the system

The system is designed with responsiveness in mind. That is, the scale and positioning of elements on the screen will adapt to the size of the browser window. However, for a specific resolution to use, try $1500 \times 800$ in the _inspect element_ developer window.

### Changing theme

1. Click the _sun_ icon in the bottom left corner of the screen. This will switch to light mode and the icon will change to a _moon_.
2. To change back to dark theme, click the _moon_ icon in the bottom left corner.

### Request assistance

1. Simply press the _Request Assistance_ button on the mid-right side of the bottom bar.

### Composing an order

1. Start with locating a desired food item. You can utilize the tabs at the very top of the interface to filter items by the listed categories.
2. Once a food item is found, click the plus ($+$) icon to begin customizing it. You will be brought to an item customization view.
3. In the item customization view, you will have the following combination of possibilities:
   - Checkboxes for including/excluding options specific to the item.
   - Dropdown menus for selecting options more complex than _yes/no_.
   - Quantity adjuster. Pressing plus ($+$) increases the quantity of the item by 1, minus ($-$) decreases it by 1.
   - Some food items may not have any options, just quantity adjustment.
4. Once the item configuration is sorted, you can press save to confirm its addition to the order. If you want to cancel, press the back arrow ($\leftarrow$) in the top left corner of the interface.
5. The item now appears in the order panel on the right side of the screen. It will display the item name, quantity, price, and configured options for easy readability.
6. If it any point you want to modify an item that is already added to the order, locate it in the order panel on the far right side of the screen. When found, select the pencil/edit icon to go back to the item configuration view.
7. If at any point you want to remove an item from the current order, select the red trash icon associated with that order item.

### Placing orders

0. If _Place Order_ is pressed when the order is empty, you will be prompted to add items to the order before you can perform this action. You may also noticed the button is greyed-out to indicate its unavailable.
1. Once an order has been composed, you can select place order. You will be then prompted with a confirmation.
2. After confirming, the order is sent to the kitchen and moved to the session order history.

### Monitor order history

1. To view the session's current order history, select the _Order History_ button in the bottom right corner of the interface.
2. After it is pressed, the order panel will switch to the order history panel and the _Order History_ button will change to a _Back To Order_ button.
3. Each order that is placed is seperated by a horizontal bar that also has the time it was placed in the center of it. Each historical order item shows its cost, quantity, and selected options.
4. To return back to the main order panel, click _Back To Order_.

### Monitor session cost

1. In the bottom right of the interface, you will see labels for the following:

- Current Order Cost
  - This displays the cost of the order that is currently being composed. This cost is not yet confirmed as the order has not been placed.
- Total Order Cost
  - This displays the total cost of orders that have already been placed. This cost has been locked in.

### Paying for the session

1. Once you have decided that you are done, select the _Pay Now_ button located in the bottom mid-right of the screen.
2. You will then be prompted with a confirmation.
3. After confirming that you want to pay, a message explaining that a waiter will be with you shortly to assist with payment will appear.
4. You are now locked out of the interface as your dining session is over.
