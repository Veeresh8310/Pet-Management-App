import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";


class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Choose Any Option Below" , style: GoogleFonts.varelaRound(color: Colors.black , fontSize: 22 , fontWeight: FontWeight.normal),),
            const SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, "/home");
            },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              ), child:const Text("Adopt" , style: TextStyle(color: Colors.white),),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/rescue');
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              ),child:const Text("Rescue" , style: TextStyle(color: Colors.white),),),
          ],
        ),
      ),
    );
  }
}