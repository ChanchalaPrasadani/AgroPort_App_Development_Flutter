import 'package:agro_port/ui/mp/home_screens/widgets/add_bulks_button.dart';
import 'package:agro_port/ui/mp/home_screens/widgets/custom_appbar.dart';
import 'package:agro_port/ui/mp/home_screens/widgets/grid_item.dart';
import 'package:agro_port/ui/mp/home_screens/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TranspoterHomePage extends StatefulWidget {
  const TranspoterHomePage({Key? key}) : super(key: key);

  @override
  State<TranspoterHomePage> createState() => _TranspoterHomePageState();
}

class _TranspoterHomePageState extends State<TranspoterHomePage> {
  List<Map<String, dynamic>> data = [
    {
      "url": "assets/images/1p.png",
      "name": "Carrot",
      "kg": 65,
      "location": "Kandy",
    },
    {
      "url": "assets/images/2p.png",
      "name": "Beet",
      "kg": 75,
      "location": "Kegalle",
    },
    {
      "url": "assets/images/3p.png",
      "name": "Cabbage",
      "kg": 50,
      "location": "Kurunegala",
    },
    {
      "url": "assets/images/4p.png",
      "name": "Leeks",
      "kg": 35,
      "location": "Kurunegala",
    },
    {
      "url": "assets/images/5p.png",
      "name": "Potato",
      "kg": 100,
      "location": "Welimada",
    },
    {
      "url": "assets/images/6p.png",
      "name": "Tomato",
      "kg": 30,
      "location": "NuwaraEliya",
    }
  ];

  Map<String, dynamic> user = {
    "profileImage": "assets/images/transpoter.png",
    "name": "W.P.Bandara",
    "district": "Colombo",
    "role": "Transpoter"
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4B91F1),
        title: CustomAppbar(user: user),
        toolbarHeight: 120.h,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          const SearchBar(),
          const AddBulksButton(),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 20.w,
                children: [...data.map((e) => GridItem(item: e))],
              ),
            ),
          )
        ],
      ),
    );
  }
}
