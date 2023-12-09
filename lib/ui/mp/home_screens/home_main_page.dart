import 'package:agro_port/ui/mp/home_screens/farmer_home_screen/farmer_home_screen.dart';
import 'package:agro_port/ui/mp/home_screens/seller_home_screen/seller_home_screen.dart';
import 'package:agro_port/ui/mp/home_screens/transpoter_home_screen/transpoter_home_screen.dart';
import 'package:flutter/material.dart';

class HomeMainPage extends StatefulWidget {
  final String userRole;
  const HomeMainPage({Key? key, required this.userRole}) : super(key: key);

  @override
  State<HomeMainPage> createState() => _HomeMainPageState();
}

class _HomeMainPageState extends State<HomeMainPage> {
  late Widget home;

  @override
  void initState() {
    if (widget.userRole == "Farmer") {
      home = const FarmerHomePage();
    }
    if (widget.userRole == "Transpoter") {
      home = const TranspoterHomePage();
    }
    if (widget.userRole == "Seller") {
      home = const SellerHomePage();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return home;
  }
}
