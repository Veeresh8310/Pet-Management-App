import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
   String email = "";

  @override
  void initState() {
    data();
    super.initState();
  }

  void state(){
    setState(() {
      
    });
  }
  Future<void> data() async{
    final box = await Hive.openBox('authkey');
    final decodedToken = JwtDecoder.decode(box.get('tokens'));
    email = decodedToken['email'];
    box.close();
    state();
  }
  Future<void> logout() async{
    final box = await Hive.openBox('authkey');
    box.delete('tokens');
    box.close();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor:Colors.amber,
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text('Profile' , style: GoogleFonts.varelaRound(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 25) ,),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.amber,
            elevation: 0,
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin:const EdgeInsets.only(top: 15),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white),
            child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 20),
                      width: double.infinity,
                      child: Card(
                        color: Colors.white,
                        shadowColor: Colors.white,
                        surfaceTintColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 0,
                        child: ListTile(
                          leading: const Icon(
                            Icons.person,
                            size: 45,
                          ),
                          title: Text(
                            "User Email",
                            style: GoogleFonts.varelaRound(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(email,
                              style: GoogleFonts.varelaRound(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(Icons.info),
                      title: Text('Version'),
                      subtitle: Text('1.0'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.computer),
                      title: Text('Developed By'),
                      subtitle: Text('Veeresh Akki'),
                    ),
                    GestureDetector(
                      onTap: (){
                          Navigator.pushReplacementNamed(context, "/login");
                          logout();
                      },
                      child:const ListTile(
                        leading: Icon(Icons.exit_to_app),
                        title: Text('Logout'),
                        subtitle: Text('Exit'),
                      ),
                    ),
                  ],
                ),
          ),
        );
  }
}