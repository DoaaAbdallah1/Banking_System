//There are two types of bank accounts. The first type is the basic BankAccount. It holds the following
// data:
// ∙ account ID
// ∙ balance
// The following methods apply to this class:
// ∙ Constructor There are 2 constructors. The first sets the balance to a given value. The second is a
// no-argument constructor and it sets the balance to 0.
// ∙ withdraw withdraws an amount of money from the account if the balance is sufficient.
// ∙ deposit deposits an amount of money in the account

import 'package:bank_account_system/class/client.dart';

class BankAccount {
  late int accountID;
  double balance;
  late Client client;
  static int counterID = 0;
  BankAccount({this.balance = 0}) {
    counterID++;
    accountID = counterID;
    print("Account created");
    print("Account ID: $accountID");
  }

  bool withdraw(double amount) {
    if (amount < 0) {
      print("Amount must be positive");
      return false;
    }
    if (balance >= amount) {
      balance -= amount;
      return true;
    } else {
      print("Insufficient funds");
      return false;
    }
  }

  bool deposit(double amount) {
    if (amount < 0) {
      print("Amount must be positive");
      return false;
    } else {
      balance += amount;
      return true;
    }
  }

  @override
  String toString() {
    return "Account ID: $accountID, Balance: $balance , Client: ${client.name} , address: ${client.address} , phone: ${client.phoneNumber}";
  }
}
