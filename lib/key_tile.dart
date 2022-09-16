import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:round_icon/round_icon.dart';
import 'package:timekey/colors.dart';
import 'package:timekey/totp.dart';

// ignore: must_be_immutable
class KeyTile extends StatefulWidget {
  String name;
  String secretKey;
  KeyTile({
    Key? key,
    required this.name,
    required this.secretKey,
  }) : super(key: key);

  @override
  State<KeyTile> createState() => _KeyTileState();
}

class _KeyTileState extends State<KeyTile> {
  late Timer _timer;
  String token = '';
  String newToken = '';

  final snackBar = const SnackBar(
    content: Text('Key copied!'),
  );

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      newToken = TOTP.getToken(widget.secretKey);
      if (newToken != token) {
        setState(() {
          token = newToken;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: ListTile(
          title: Text(widget.name),
          subtitle: Text(token),
          leading: RoundIcon(
            icon: Icons.key,
            iconColor: MyColors.green,
            backgroundColor: MyColors.darkGrey,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.copy),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: token));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ),
      ),
    );
  }
}
