import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upper_express_ionic/app/ui/pages/dashboard/controller/shipment_controller.dart';
import 'package:upper_express_ionic/app/ui/pages/dashboard/widgets/list_tile_shipment.dart';
import 'package:upper_express_ionic/app/utils/my_colors.dart';
import 'package:upper_express_ionic/generated/l10n.dart';

class ShipmentPage extends StatelessWidget {
  const ShipmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ShipmentController>(
          create: (_) => ShipmentController(),
          lazy: true,
        ),
      ],
      child: const ShipmentPageWrapper(),
    );
  }
}

class ShipmentPageWrapper extends StatefulWidget {
  const ShipmentPageWrapper({Key? key}) : super(key: key);

  @override
  State<ShipmentPageWrapper> createState() => _ShipmentPageWrapperState();
}

class _ShipmentPageWrapperState extends State<ShipmentPageWrapper> {
  TextStyle titleStyle = const TextStyle(
    fontSize: 18,
  );

  Future<void> _pullRefresh() async {
    print("refresh");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.current.myShopping,
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: MyColors.backgroundAccent,
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.add,
              color: Theme.of(context).primaryColor,
            ),
            label: Text(
              S.current.newNotice,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _pullRefresh,
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 6),
              child: Text(
                'En USA us',
                style: titleStyle,
              ),
            ),
            const Divider(thickness: 3,),
            ListTileShipment(
              leading: Image.asset("assets/brands/shein.png"),
              code: "UPX1578",
              title: "SHEIN",
              weight: 8,
              packages: 1,
            ),
            ListTileShipment(
              leading: Image.asset("assets/brands/amazon_icon.png"),
              code: "UPX1580",
              title: "AMAZON COMPRAS INC",
              weight: 8,
              packages: 1,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 6),
              child: Text(
                'En Ecuador ec',
                style: titleStyle,
              ),
            ),
            const Divider(thickness: 3,),
            ListTileShipment(
              leading: Image.asset("assets/brands/amazon_icon.png"),
              code: "UPX1579",
              title: "AMAZON COMPRAS INC",
              weight: 20,
              packages: 2,
            ),
          ],
        ),
      ),
    );
  }
}

