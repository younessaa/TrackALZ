import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
            child: Container(
              decoration: BoxDecoration(
              color: Color(0xFFE36262),
              ),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1, color: Color(0xFF878686), style: BorderStyle.solid),
                      ),
                    ),
                    child: DrawerHeader(
                      child: Container(
                        padding: EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset("assets/images/tackalz-logo.jpg"),
                            ),
                            TrackALZText(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  drawerItem(Icons.person, 'Profil'),
                  drawerItem(Icons.settings, 'Paramètres'),
                  drawerItem(Icons.info_outline, 'À propos de nous'),
                  drawerItem(Icons.logout, 'Se déconnecter'),
                ],
              ),
            ),
          );
  }

  ListTile drawerItem(IconData icon, String title) {
    return ListTile(
                title: Container(
                  padding: EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 12),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 16),
                        child: Icon(
                          icon,
                          size: 25,
                          color: Colors.white,
                        )
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              );
  }
}

class TrackALZText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
        text: 'Track',
        style: TextStyle(
            color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        children: <InlineSpan>[
          TextSpan(
            text: 'ALZ',
            style: TextStyle(
                color: Color(0xFFD80000), fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ]));
  }
}