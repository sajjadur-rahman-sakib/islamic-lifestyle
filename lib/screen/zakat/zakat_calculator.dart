import 'package:flutter/material.dart';
import 'package:sakib/utility/app_colors.dart';
import 'package:sakib/widget/option_app_bar.dart';

class ZakatCalculator extends StatefulWidget {
  final double number;

  const ZakatCalculator({super.key, required this.number});

  @override
  State<ZakatCalculator> createState() => _ZakatCalculatorState();
}

class _ZakatCalculatorState extends State<ZakatCalculator> {
  TextEditingController cashInHandTEController = TextEditingController();
  TextEditingController cashInBankTEController = TextEditingController();
  TextEditingController investMoneyTEController = TextEditingController();
  TextEditingController savingsFundTEController = TextEditingController();
  TextEditingController savingsGoodsTEController = TextEditingController();
  TextEditingController loanTEController = TextEditingController();
  TextEditingController liabilitiesTEController = TextEditingController();
  TextEditingController othersTEController = TextEditingController();
  double total = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      appBar: optionAppBar('Zakat Calculator'),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: cashInHandTEController,
                  style: const TextStyle(
                    color: AppColors.textDefaultColor,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Cash in hand',
                    labelText: 'Cash in hand',
                    hintStyle: TextStyle(
                      color: AppColors.textDefaultColor,
                    ),
                    labelStyle: TextStyle(
                      color: AppColors.textDefaultColor,
                    ),
                  ),
                ),
                SizedBox(height: height / 50),
                TextFormField(
                  controller: cashInBankTEController,
                  style: const TextStyle(
                    color: AppColors.textDefaultColor,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Cash in Bank',
                    labelText: 'Cash in Bank',
                    hintStyle: TextStyle(
                      color: AppColors.textDefaultColor,
                    ),
                    labelStyle: TextStyle(
                      color: AppColors.textDefaultColor,
                    ),
                  ),
                ),
                SizedBox(height: height / 50),
                TextFormField(
                  controller: investMoneyTEController,
                  style: const TextStyle(
                    color: AppColors.textDefaultColor,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Invest Money',
                    labelText: 'Invest Money',
                    hintStyle: TextStyle(
                      color: AppColors.textDefaultColor,
                    ),
                    labelStyle: TextStyle(
                      color: AppColors.textDefaultColor,
                    ),
                  ),
                ),
                SizedBox(height: height / 50),
                TextFormField(
                  controller: savingsFundTEController,
                  style: const TextStyle(
                    color: AppColors.textDefaultColor,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Savings in Fund',
                    labelText: 'Savings in Fund',
                    hintStyle: TextStyle(
                      color: AppColors.textDefaultColor,
                    ),
                    labelStyle: TextStyle(
                      color: AppColors.textDefaultColor,
                    ),
                  ),
                ),
                SizedBox(height: height / 50),
                TextFormField(
                  controller: savingsGoodsTEController,
                  style: const TextStyle(
                    color: AppColors.textDefaultColor,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Savings in Goods',
                    labelText: 'Savings in Goods',
                    hintStyle: TextStyle(
                      color: AppColors.textDefaultColor,
                    ),
                    labelStyle: TextStyle(
                      color: AppColors.textDefaultColor,
                    ),
                  ),
                ),
                SizedBox(height: height / 50),
                TextFormField(
                  controller: loanTEController,
                  style: const TextStyle(
                    color: AppColors.textDefaultColor,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Loan',
                    labelText: 'Loan',
                    hintStyle: TextStyle(
                      color: AppColors.textDefaultColor,
                    ),
                    labelStyle: TextStyle(
                      color: AppColors.textDefaultColor,
                    ),
                  ),
                ),
                SizedBox(height: height / 50),
                TextFormField(
                  controller: liabilitiesTEController,
                  style: const TextStyle(
                    color: AppColors.textDefaultColor,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Liabilities',
                    labelText: 'Liabilities',
                    hintStyle: TextStyle(
                      color: AppColors.textDefaultColor,
                    ),
                    labelStyle: TextStyle(
                      color: AppColors.textDefaultColor,
                    ),
                  ),
                ),
                SizedBox(height: height / 50),
                TextFormField(
                  controller: othersTEController,
                  style: const TextStyle(
                    color: AppColors.textDefaultColor,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Others',
                    labelText: 'Others',
                    hintStyle: TextStyle(
                      color: AppColors.textDefaultColor,
                    ),
                    labelStyle: TextStyle(
                      color: AppColors.textDefaultColor,
                    ),
                  ),
                ),
                SizedBox(height: height / 50),
                SizedBox(
                  height: height / 18,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _calculate,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.functionalButtonColor,
                    ),
                    child: const Text(
                      "Calculate",
                      style: TextStyle(
                        color: AppColors.textDefaultColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height / 50),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total: ",
                        style: TextStyle(
                          color: AppColors.textDefaultColor,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        total.toString(),
                        style: const TextStyle(
                          color: AppColors.textDefaultColor,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _calculate() {
    double number = 0;
    number = widget.number;
    double numberCashInHand = double.tryParse(cashInHandTEController.text) ?? 0;
    double numberCashInBank = double.tryParse(cashInBankTEController.text) ?? 0;
    double numberInvestMoney =
        double.tryParse(investMoneyTEController.text) ?? 0;
    double numberSavingsFund =
        double.tryParse(savingsFundTEController.text) ?? 0;
    double numberSavingsGoods =
        double.tryParse(savingsGoodsTEController.text) ?? 0;
    double numberLoan = double.tryParse(loanTEController.text) ?? 0;
    double numberLiabilities =
        double.tryParse(liabilitiesTEController.text) ?? 0;
    double numberOthers = double.tryParse(othersTEController.text) ?? 0;

    double totalSavings = (numberCashInHand +
        numberCashInBank +
        numberInvestMoney +
        numberSavingsFund +
        numberSavingsGoods +
        numberOthers);
    double totalLiabilities = (numberLoan + numberLiabilities);
    double netAssets = (totalSavings - totalLiabilities);

    double nisab = (number * 7.5);
    if (netAssets >= nisab && number >= 1) {
      total = ((netAssets / 100) * 2.5);
      setState(() {});
    }
  }

  @override
  void dispose() {
    cashInHandTEController.dispose();
    cashInBankTEController.dispose();
    investMoneyTEController.dispose();
    savingsFundTEController.dispose();
    savingsGoodsTEController.dispose();
    loanTEController.dispose();
    liabilitiesTEController.dispose();
    othersTEController.dispose();
    super.dispose();
  }
}
