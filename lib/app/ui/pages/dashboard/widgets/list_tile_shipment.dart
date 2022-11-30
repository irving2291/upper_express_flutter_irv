import 'package:flutter/material.dart';
import 'package:upper_express_ionic/generated/l10n.dart';

class ListTileShipment extends StatelessWidget {
  final String code;
  final String title;
  final double weight;
  final int packages;
  final Widget? leading;

  const ListTileShipment({
    Key? key,
    required this.code,
    required this.title,
    required this.weight,
    required this.packages,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;

    return Column(
      children: [
        ListTile(
          leading: leading,
          title: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  color: primary,
                  child: Text(
                    code,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(title),
              ),
            ],
          ),
          subtitle: Text(S.current.package(packages)),
          trailing: Text("$weight lbs"),
        ),
        const Divider(
          thickness: 1,
        ),
      ],
    );
  }
}
