import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petapp/pet_page.dart';



class HomePageCard extends StatelessWidget {
  final String image;
  final String name;
  final String age;
  final String type;
  final String details;
  final String phone;
  const HomePageCard({super.key , required this.image , required this.name , required this.age , required this.details , required this.phone , required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
          margin:const EdgeInsets.only(left: 20, right: 20 , top: 10 , bottom: 10),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 10),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      image,
                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin:const EdgeInsets.only(left: 15),
                          width: 200,
                          child: Text(
                            name,maxLines: 1,overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.varelaRound(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin:const EdgeInsets.only(left: 15 , top: 2),
                          width: 200,
                          child: Text(
                            'Age:$age',
                            style: GoogleFonts.varelaRound(
                                color: Colors.grey, fontSize: 15),
                          ),
                        )
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.amber),
                      width: 100,
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                                   Navigator.push(context, MaterialPageRoute(builder: (context) =>  PetPage(commonName: name, scintificName: age, kannadaName: type, breedingSeason: phone, identification: details, image: image)));
                          },
                          icon:const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                            weight: 20,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
  }
}