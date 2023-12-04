import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:payment_app/Core/widgets/Custom_button.dart';
import 'package:payment_app/Features/checkout/presention/views/thank_you_view.dart';

class CustomCreditCard extends StatefulWidget {
  const CustomCreditCard({super.key});

  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

final GlobalKey<FormState> formkey = GlobalKey();
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
String cardNumber = "", expiryDate = "", cardHolderName = "", cvvCode = '';
bool showBackView = false;

class _CustomCreditCardState extends State<CustomCreditCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          isHolderNameVisible: true,
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: showBackView,
          onCreditCardWidgetChange: (value) {},
        ),
        CreditCardForm(
            autovalidateMode: autovalidateMode,
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            onCreditCardModelChange: (value) {
              cardNumber = value.cardNumber;
              expiryDate = value.expiryDate;
              cardHolderName = value.cardHolderName;
              cvvCode = value.cvvCode;
              showBackView = value.isCvvFocused;
              setState(() {});
            },
            formKey: formkey),
        Padding(
          padding:
              const EdgeInsets.only(top: 35, left: 20, right: 20, bottom: 10),
          child: CustomButton(
            text: "Pay",
            ontab: () {
              if (formkey.currentState!.validate()) {
                formkey.currentState!.save();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ThankYouView(),
                    ));
              } else {
                autovalidateMode = AutovalidateMode.always;
              }
            },
          ),
        ),
      ],
    );
  }
}
