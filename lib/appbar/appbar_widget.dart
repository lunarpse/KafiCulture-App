// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:project_2/cart/riverpod/cargo_state_provider.dart';
import 'package:project_2/cart/riverpod/state_provider.dart';
import 'package:project_2/constants/color_constants.dart';
import 'package:project_2/constants/text_constants.dart';
import '../cart/riverpod/switch_provider.dart';
import 'package:badges/badges.dart' as badges;

class AppbarWidget extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  AppbarWidget({super.key, this.incart = true});

  final incart;

  @override
  ConsumerState<AppbarWidget> createState() => _AppbarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _AppbarWidgetState extends ConsumerState<AppbarWidget> {
  bool _isNFCavailable = false;

  @override
  Widget build(BuildContext context) {
    final cartItemNos = ref.watch(SwitchProvider) == true
        ? ref.watch(CartProvider)
        : ref.watch(CargoProvider);
    final cartItemNo = cartItemNos.length;

    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: Image.asset(
        "assets/images/appbarbg4.jpg",
        fit: BoxFit.cover,
      ),
      title: GestureDetector(
        onTap: () {
          Navigator.pushReplacementNamed(context, "/home");
          ref.watch(SwitchProvider.notifier).toggle(true);
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor: circleavatarbgcolor,
              backgroundImage: AssetImage("assets/images/logo1.png"),
              radius: 18,
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  apptitle,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  appslogan,
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
              backgroundColor: _isNFCavailable == true
                  ? nfcCircleAvatarAvailableColor
                  : nfcCircleAvatarNotAvailableColor,
              radius: 14,
              child: Icon(
                Icons.nfc_rounded,
                size: 22,
                color: nfcIconColor,
              ),
            )),
        widget.incart == true
            ? Padding(
                padding: const EdgeInsets.only(right: 5),
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/cart");
                  },
                  icon: badges.Badge(
                    badgeContent: Text(
                      "$cartItemNo",
                      style: TextStyle(color: badgeTextColor),
                    ),
                    badgeAnimation: badges.BadgeAnimation.scale(),
                    showBadge: cartItemNo == 0 ? false : true,
                    child: Icon(Icons.shopping_cart),
                  ),
                  color: cartIconColor,
                  iconSize: 27,
                ),
              )
            : SizedBox(
                width: 15,
              ),
      ],
    );
  }

  void _checkNFCStatus() async {
    try {
      bool isAvailable = await NfcManager.instance.isAvailable();
      setState(() {
        _isNFCavailable = isAvailable;
      });

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
            readyToScan,
            style: TextStyle(fontSize: 25),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(moveTheNFC, style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              Icon(
                Icons.nfc,
                size: 55,
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(ok, style: TextStyle(fontSize: 18)),
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
          title: Text(dialogTitle),
          content: Text(dialogContent),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                ok,
                style: TextStyle(fontSize: 17),
              ),
            )
          ],
        );
      },
    );
  }
}
