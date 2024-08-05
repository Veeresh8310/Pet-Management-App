import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petapp/home_page_card.dart';
import 'bloc/home/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
     BlocProvider.of<HomeBloc>(context).add(
      HomePageFetchEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text('Home Page',
              style: GoogleFonts.varelaRound(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
        ),
        actions: [
          IconButton(
            icon: const Padding(
              padding: EdgeInsets.only(top: 8, right: 10),
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 40,
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          )
        ],
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber,
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.only(top: 15),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
                  if(state is HomePageFetchState){
                    return ListView.builder(
                itemBuilder: (context, index) {
                  return HomePageCard(image: state.data[index]['image'] , name: state.data[index]['name'],age: state.data[index]['age'],details: state.data[index]['description'],phone: state.data[index]['phone'],type: state.data[index]['type'],);
                },
                itemCount: state.data.length,
              );
  
                  }else if(state is HomePageErrorState){
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.network_wifi_1_bar_rounded),
                          const SizedBox(height: 10,),
                          const Text("Something Went Really Wrong..."),
                          const SizedBox(height: 5,),
                          ElevatedButton(onPressed: (){
                            BlocProvider.of<HomeBloc>(context).add(
                              HomePageFetchEvent(),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ), child: const Text('Retry',
                          ),
                          ),
                        ],
                      ),
                    );
                  }
                  else {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.amber,
                      )
                    );
                  }
              }
          ),
        ),
    );
  }
}