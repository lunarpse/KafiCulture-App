import 'package:flutter/material.dart';

enum SingingCharacter { Paytm, Amazonpay }

// ignore: camel_case_types
class WalletList extends StatefulWidget {
  const WalletList({super.key});
  @override
  State<WalletList> createState() => _wallet_listState();
}

// ignore: camel_case_types
class _wallet_listState extends State<WalletList> {
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    SingingCharacter? _character = SingingCharacter.Paytm;
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: 400,
        height: 170,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 244, 242, 242),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.4),
                spreadRadius: 0,
                blurRadius: 4),
          ],
        ),
        child: Column(
          children: [
            Column(
              children: <Widget>[
                ListTile(
                  title: const Text(
                    'Paytm Wallet',
                    style: TextStyle(fontSize: 20),
                  ),
                  leading: Radio<SingingCharacter>(
                    value: SingingCharacter.Paytm,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text(
                    'AmazonPay Wallet',
                    style: TextStyle(fontSize: 20),
                  ),
                  leading: Radio<SingingCharacter>(
                    value: SingingCharacter.Amazonpay,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            TextButton(
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Other Wallets",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                    Icon(Icons.arrow_forward_outlined)
                  ],
                ))
          ],
        ));
  }
}
