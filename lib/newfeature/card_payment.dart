import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CardPayment extends StatelessWidget {
  CardPayment({super.key});
  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Text("Debit/Credit card"),
        children: [
          CreditCardWidget(
            cardNumber: "9898989898989898",
            expiryDate: "77/88",
            cardHolderName: "cardHolderName",
            cvvCode: "XXX",
            showBackView: true,
            onCreditCardWidgetChange: (p0) {},
          ),
          CreditCardForm(
              cardNumber: "cardNumber",
              expiryDate: "expiryDate",
              cardHolderName: "cardHolderName",
              cvvCode: "cvvCode",
              onCreditCardModelChange: (I) {},
              formKey: formKey2),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                foregroundColor: Color(0xff1b447)),
            child: Container(
              margin: EdgeInsets.all(8.0),
              child: const Text(
                'validate',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'halter',
                  fontSize: 14,
                  package: 'flutter_credit-card',
                ),
              ),
            ),
            onPressed: () {
              if (formKey2.currentState!.validate()) {
                print('valid');
              } else {
                print('inValid');
              }
            },
          )
        ],
      ),
    );
  }
}
