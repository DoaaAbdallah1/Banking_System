// The second type of accounts extends the basic Bank Account and may have some extra data fields and
// operations. It is called SavingsBankAccount.
// This account requires the user to keep a minimum amount of money in the account, which is called the
// minimum balance, as long as the account is open. It also requires him to make deposits that are not less
// than 100 a time. So, it has the following additional data field:
// ∙ minimumBalance This minimum balance takes a default value of 1000 L.E.
// It has the following methods plus those inherited from the parent class:
// ∙ Constructor The constructor sets the value of the initial balance and the minimum balance. Initial
// balance should be >= min balance.
// ∙ withdraw overrides the method withdraw to allow withdrawing money but not below the minimum
// balance.
// ∙ deposit deposits an amount of money in the account but only if the amount to deposit is 100 or more.

import 'package:bank_account_system/class/bank_account.dart';

class SavingsBankAccount extends BankAccount {
  double minimumBalance;

  SavingsBankAccount({super.balance, this.minimumBalance = 1000.0}) {
    if (balance < minimumBalance) {
      throw Exception("Balance should be greater than minimum balance");
    }
  }
  @override
  bool withdraw(double amount) {
    if (amount < 0) {
      return false;
    }
    if (balance - amount < minimumBalance) {
      return false;
    }
    return super.withdraw(amount);
  }

  @override
  bool deposit(double amount) {
    if (amount < 100) {
      return false;
    }
    return super.deposit(amount);
  }

  @override
  String toString() {
    return ' ${super.toString()}, minimumBalance: $minimumBalance';
  }
}
