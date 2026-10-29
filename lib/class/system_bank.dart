// The banking application allows the user, i.e.,
// the bank employee to create a bank account for a specific client.
// It allows him to list all the available bank accounts.
// For each account, it allows him to display the account details,
// withdraw money and deposit money.

import 'dart:io';

import 'package:bank_account_system/class/bank_account.dart';
import 'package:bank_account_system/class/client.dart';
import 'package:bank_account_system/class/saving_bank_account.dart';

class SystemBank {
  late List<BankAccount> accounts;
  late List<Client> clients;

  SystemBank() {
    accounts = [];
    clients = [];
  }
  void menuInfo() {
    while (true) {
      print("Welcome to the banking application\n");

      print("1. Create Account");
      print("2. List all accounts");
      print("3. Display account details");
      print("4. Withdraw money");
      print("5. Deposit money");
      print("6. Delete account");
      print("7. Exit");

      String? choice = stdin.readLineSync();

      switch (choice) {
        case "1":
          createAccount();
          break;
        case "2":
          listAllAccounts();
          break;
        case "3":
          print("Please enter the account ID to display the details");
          int? id = int.tryParse(stdin.readLineSync()!);
          if (id == null) {
            print("Invalid input");
            menuInfo();
          } else {
            displayAccountDetails(id);
          }

          break;
        case "4":
          print("Please enter the account ID to withdraw money");
          int? id = int.tryParse(stdin.readLineSync()!);
          if (id == null) {
            print("Invalid input");
            menuInfo();
            return;
          }
          print("Please enter the amount to withdraw");
          double? amount = double.tryParse(stdin.readLineSync()!);
          if (amount == null) {
            print("Invalid input");
            menuInfo();
            return;
          } else {
            withdrawMoney(id, amount);
          }

          break;
        case "5":
          print("Please enter the account ID to deposit money");
          int? id = int.tryParse(stdin.readLineSync()!);
          if (id == null) {
            print("Invalid input");
            menuInfo();
            return;
          }
          print("Please enter the amount to deposit");
          double? amount = double.tryParse(stdin.readLineSync()!);
          if (amount == null) {
            print("Invalid input");
            menuInfo();
            return;
          } else {
            depositMoney(id, amount);
          }

          break;
        case "6":
          print("Please enter the account ID to delete");
          int? id = int.tryParse(stdin.readLineSync()!);
          if (id == null) {
            print("Invalid input");
            menuInfo();
            return;
          } else {
            deleteAccount(id);
          }
          break;
        case "7":
          exit(0);
          break;
        default:
          print("Invalid choice");
          break;
      }
    }
  }

  void createAccount() {
    print("Start creating account");
    print("Enter client name: ");
    String name = stdin.readLineSync()!;
    print("Enter client address: ");
    String address = stdin.readLineSync()!;
    print("Enter client phone number: ");
    String phoneNumber = stdin.readLineSync()!;
    Client client = Client(
      name: name,
      address: address,
      phoneNumber: phoneNumber,
    );

    BankAccount account;
    print("Please enter balance: ");
    double? balance = double.tryParse(stdin.readLineSync()!);
    if (balance == null) {
      print("Invalid balance");
      return;
    }
    print("Enter account type: 1. savings bank account 2. bank account");
    String type = stdin.readLineSync()!;
    if (type == "1") {
      print("Enter minimum balance: ");
      double? minBalance = double.tryParse(stdin.readLineSync()!);
      if (minBalance == null) {
        print("Invalid minimum balance");
        return;
      }
      account = SavingsBankAccount(
        balance: balance,
        minimumBalance: minBalance,
      );
    } else if (type == "2") {
      account = BankAccount(balance: balance);
    } else {
      print("Invalid account type");
      return;
    }
    client.account = account;
    account.client = client;
    clients.add(client);
    accounts.add(account);
    print("Account created successfully");
  }

  void listAllAccounts() {
    for (var account in accounts) {
      print(account);
    }
  }

  bool searchClient(int id) {
    for (var client in clients) {
      if (client.account.accountID == id) {
        return true;
      }
    }
    return false;
  }

  BankAccount? getAccount(int id) {
    for (var client in clients) {
      if (client.account.accountID == id) {
        return client.account;
      }
    }
    return null;
  }

  void displayAccountDetails(int id) {
    BankAccount? account = getAccount(id);
    if (account != null) {
      print(account);
    } else {
      print("Account not found");
    }
  }

  void withdrawMoney(int id, double amount) {
    BankAccount? account = getAccount(id);
    if (account == null) {
      print("Account not found");
      return;
    }
    if (account.withdraw(amount)) {
      print("Withdrawal successful");
    } else {
      print("Insufficient balance");
    }
  }

  void depositMoney(int id, double amount) {
    BankAccount? account = getAccount(id);
    if (account == null) {
      print("Account not found");
      return;
    }
    if (account.deposit(amount)) {
      print("Deposit successful");
    } else {
      print("Deposit failed");
    }
  }

  void deleteAccount(int id) {
    BankAccount? account = getAccount(id);
    if (account == null) {
      print("Account not found");
      return;
    }
    clients.remove(account.client);
    accounts.remove(account);
    print("Account deleted successfully");
  }
}
