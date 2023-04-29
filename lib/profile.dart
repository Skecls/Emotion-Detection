import 'package:flutter/material.dart';
import 'homescreen.dart';

class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: AssetImage("assets/images/profile-1.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      'MeowMeow123',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () => {
                Navigator.pop(context),
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                ),
              },
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () => {
                Navigator.pop(context),
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => profile()),
                ),
              },
            ),
            ListTile(
              title: Text('Sign out'),
              onTap: () => {Navigator.pop(context)},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.only(
              top: 40,
            ),
            child: Column(
              children: [
                Container(
                  width: 170,
                  height: 170,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFC8C8C8), width: 2),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image(
                      image: AssetImage("assets/images/profile-1.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '@meowmeow123',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Helvetica now',
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  width: 350,
                  height: 55,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFC8C8C8),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Aman Singh',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: 350,
                  height: 55,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFC8C8C8),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'singh.aman200226@gmail.com',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

/*Container(
  padding: const EdgeInsets.only(
    top: 40,
  ),
  child: const Align(
    alignment: Alignment.topCenter,
    child: CircleAvatar(
      radius: 80.0,
      backgroundImage: AssetImage(assets\images\gallery.png),
    ),
  ),
));*/