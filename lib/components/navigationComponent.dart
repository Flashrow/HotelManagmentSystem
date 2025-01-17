import 'package:flutter/material.dart';
import 'package:hotel_management_system/API/ApiClient.dart';
import 'package:hotel_management_system/pages/login/loginScreen.dart';
import 'package:hotel_management_system/utils/whoAmI.dart';
import 'package:provider/provider.dart';

class NavigationName {
  String buttonName;
  String buttonRoute;
  NavigationName({required this.buttonName, required this.buttonRoute});
}

class NavigationComponent extends StatefulWidget {
  late List<String> navigationRole;
  NavigationComponent({Key? key, required this.navigationRole})
      : super(key: key);

  @override
  _NavigationComponentState createState() => _NavigationComponentState();
}

List<NavigationName> createNavigationList(List<String> navigationRole) {
  List<NavigationName> navigationList = [];
  navigationRole.forEach((element) {
    print("Navigation Role: " + element);
    NavigationController.getNavigation(navigationList, element);
  });
  return navigationList;
}

logout(BuildContext context) {
  context.read<ApiClient>().auth.logout().then((value) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
      (route) => false,
    );
  });
}

class _NavigationComponentState extends State<NavigationComponent> {
  @override
  Widget build(BuildContext context) {
    List<NavigationName> navigationList =
        createNavigationList(widget.navigationRole);
    return Material(
      color: Theme.of(context).primaryColor,
      child: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/hotelNameBackground.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                child: ListView.builder(
                  itemCount: navigationList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        navigationList[index].buttonName,
                        style: TextStyle(color: Colors.white),
                      ),
                      leading: Icon(Icons.home, color: Colors.white),
                      onTap: () => {
                        print("navigationList[index].buttonRoute"),
                        print(navigationList[index].buttonRoute),
                        Navigator.pushNamed(
                            context, navigationList[index].buttonRoute,
                            arguments: {'role': widget.navigationRole})
                      },
                    );
                  },
                ),
              ),
            ),
            InkWell(
              onTap: () => logout(context),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
                child: Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
                        child: Icon(Icons.logout, color: Colors.white),
                      ),
                      Text('Wyloguj się',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
