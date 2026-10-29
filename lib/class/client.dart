// There is also a Client class which holds the basic information of a client like his name, address and phone
// number. It holds a pointer to his bank account. An account also points to its owner.

import 'package:bank_account_system/class/bank_account.dart';

class Client {
  String name;
  String address;
  String phoneNumber;
  late BankAccount account;

  Client({
    required this.name,
    required this.address,
    required this.phoneNumber,
  });

  @override
  String toString() {
    return account.toString();
  }
}
