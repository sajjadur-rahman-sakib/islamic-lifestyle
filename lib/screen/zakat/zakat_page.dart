import 'package:flutter/material.dart';
import '../../utility/app_colors.dart';
import '../../widget/option_app_bar.dart';
import 'zakat_calculator.dart';

class Zakat extends StatefulWidget {
  const Zakat({super.key});

  @override
  State<Zakat> createState() => _ZakatState();
}

class _ZakatState extends State<Zakat> {
  TextEditingController textEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      appBar: optionAppBar('Nisab'),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            child: Wrap(
              children: [
                const Text(
                  "Nisab is a threshold, referring to the minimum amount of wealth and possessions that a Muslim must own before being obligated to pay zakat.",
                  style: TextStyle(
                      color: AppColors.textDefaultColor, fontSize: 16),
                ),
                SizedBox(
                  height: height / 30,
                ),
                const Text(
                  "The nisab threshold for gold is 87.48g (7.5 Tola/Vori), The nisab threshold for silver is 612.36g (52.52 Tola/Vori) or their cash equivalent",
                  style: TextStyle(
                      color: AppColors.textDefaultColor, fontSize: 16),
                ),
                SizedBox(
                  height: height / 30,
                ),
                const Text(
                  "To calculate nisab, Enter the current price of gold in vori : ",
                  style: TextStyle(
                      color: AppColors.textDefaultColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: Form(
                    key: _formKey,
                    child: Center(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 5, right: 5),
                        child: TextFormField(
                          controller: textEditingController,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          validator: (String? value) {
                            if (value?.trim().isEmpty ?? true) {
                              return 'Enter the price of 1 vori gold.';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: const TextStyle(
                            color: AppColors.textDefaultColor,
                          ),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 8),
                            hintText: 'Write the price of 1 vori gold.',
                            labelText: 'Write the price of 1 vori gold.',
                            hintStyle: TextStyle(
                              color: AppColors.textDefaultColor,
                            ),
                            labelStyle: TextStyle(
                              color: AppColors.textDefaultColor,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
                  child: SizedBox(
                    height: height / 18,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          double number =
                              double.tryParse(textEditingController.text) ?? 0;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ZakatCalculator(number: number),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.functionalButtonColor,
                      ),
                      child: const Text(
                        "Next",
                        style: TextStyle(
                          color: AppColors.textDefaultColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
