// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';

class AppbarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  State<AppbarWidget> createState() => _AppbarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _AppbarWidgetState extends State<AppbarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: Image.asset(
        "assets/images/appbarbg4.jpg",
        fit: BoxFit.cover,
      ),
      title: GestureDetector(
        onTap: () {
          Navigator.pushReplacementNamed(context, "/home");
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/images/logo1.png"),
              radius: 18,
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "KAFICULTURE",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "Where every cup tells a story",
                  style: TextStyle(
                      fontFamily: 'Ephesis', fontSize: 17.5, letterSpacing: 1),
                ),
              ],
            )
          ],
        ),
      ),
      leading: Builder(builder: (BuildContext context) {
        return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.menu));
      }),
      actions: [
        InkWell(
          onTap: _checkNFCStatus,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: AssetImage("assets/images/nfc.png"),
            radius: 20,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "/cart");
          },
          icon: Icon(Icons.shopping_cart),
          color: Color.fromRGBO(78, 43, 18, 0.9),
          iconSize: 25,
        ),
      ],
    );
  }

  void _checkNFCStatus() async {
    try {
      bool isAvailable = await NfcManager.instance.isAvailable();

      if (isAvailable) {
        _startNFCSession();
      } else {
        _showNoNFCDialog();
      }
    } catch (e) {
      debugPrint("error reading NFC: $e");
    }
  }

  void _startNFCSession() {
    print("NFC working");
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          alignment: Alignment.bottomCenter,
          title: Text(
            "Ready to Scan",
            style: TextStyle(fontSize: 25),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Move the NFC tag to the back of your phone",
                  style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              Icon(
                Icons.nfc,
                size: 55,
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Cancel", style: TextStyle(fontSize: 18)),
            )
          ],
        );
      },
    );
    // NfcManager.instance.startSession(onDiscovered: _handleNFCDiscovered);
  }

  Future<void> _handleNFCDiscovered(NfcTag tag) async {
    // String tagId = tag.id;
    print("NFC Tag is discovered $tag");
  }

  void _showNoNFCDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("NFC not enabled or no NFC service"),
          content: Text(
              "Please enable NFC in your device settings or this device does not support NFC feature."),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("OK"),
            )
          ],
        );
      },
    );
  }
}
