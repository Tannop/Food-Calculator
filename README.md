# Food Store Calculator

This Flutter application allows users to calculate the total price of their food store orders based on the selected items and membership status.
## Installation

To run this app, make sure you have Flutter installed on your machine. Then, clone this repository and run `flutter run` in the project directory.

`git clone https://github.com/your-username/food-store-calculator.git`

`cd food-store-calculator`

`flutter run`

## Usage
- Select the quantity of each item from the menu.
- Toggle the membership card checkbox to apply a 10% discount.
- An additional 5% discount is applied for ordering more than 2 sets of Orange, Pink, or Green items.
- The total price will be displayed at the bottom of the screen.

## Code Documentation
- CalculatorScreen

  The CalculatorScreen widget represents the main screen of the food store calculator app. It is a stateful widget that maintains the state of the orders and membership status. It displays a list of menu items with quantity selectors, a checkbox for membership status, and the total price of the order.

 -  State

    - _CalculatorScreenState: 

      The state class is associated with the CalculatorScreen widget. It manages the state of the orders and membership status.

    - State Properties:

      orders: A map containing the quantity of each menu item ordered.
      isMember: A boolean flag indicating whether the user has a membership card.
    -  State Methods:
      
        calculateTotalPrice(): Calculates the total price of the order based on the quantity of each item ordered and any applicable discounts.
       
## Unit Test 

The test cases ensure that the functionality of the CalculatorScreen widget works as expected.

- Initial Total Price Test
  
    Test Description: Verify that the initial total price is 0 THB.
    
    Test Steps:
    
    1. Pump the widget with MyApp.
    
    2. Verify the presence of the text 'Total Price: 0.0 THB'.

 - Total Price Without Member Card and No Discounts Test
   
    Test Description: Verify the total price calculation without a member card and no discounts.
  
    Test Steps:
    
    1. Pump the widget with MyApp.
    
    2. Tap the '+' button for the Red item twice.
    
    3. Tap the '+' button for the Green item once.
    
    4. Verify the presence of the text 'Total Price: 140.0 THB'.

  - Total Price With Member Card and No Discounts Test
    
    Test Description: Verify the total price calculation with a member card and no discounts.
  
    Test Steps:
  
    1. Pump the widget with MyApp.
  
    2. Tap the Member Card checkbox.
  
    3. Tap the '+' button for the Yellow item three times.
  
    4. Verify the presence of the text 'Total Price: 135.0 THB'.

## Unit Test Run

To run the Unit test use `flutter test lib/test/test_case.dart` in terminal

## Contributing

Tannop Sangvanloy created this flutter app on March 10, 2024.



