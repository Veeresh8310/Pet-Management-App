import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petapp/bloc/home/home_bloc.dart';
import 'package:petapp/custom_scaffold_messager.dart';
import 'package:petapp/custom_text_feild.dart';

class RescuePage extends StatefulWidget {
  const RescuePage({super.key});

  @override
  State<RescuePage> createState() => _RescuePageState();
}

class _RescuePageState extends State<RescuePage> {
  final TextEditingController _petNameController = TextEditingController();
  final TextEditingController _petTypeController = TextEditingController();
  final TextEditingController _petAgeController = TextEditingController();
  final TextEditingController _petOwnerPhoneController =
      TextEditingController();
  final TextEditingController _petImageLinkController = TextEditingController();
  final TextEditingController _petDetailsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if(state is RescueFormLodingState){
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.yellow,
                  ),
                );
              });
        }else if(state is RescueFormSubmitFailureState){
          Navigator.pop(context);
          ScaffoldMessage.showScaffoldMessanger(context, state.errorMessage);
        }else if(state is RescueFormSubmitSuccessState){
          Navigator.pop(context);
          Navigator.pop(context);
          ScaffoldMessage.showScaffoldMessanger(context, state.message);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.amber,
          appBar: AppBar(
            title: Text(
              "Rescue Form",
              style: GoogleFonts.varelaRound(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.amber,
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                      icon: Icons.pets,
                      isObscure: false,
                      placeholder: "Pet Name",
                      controller: _petNameController),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    icon: Icons.type_specimen,
                    isObscure: false,
                    placeholder: "Pet Type",
                    controller: _petTypeController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    placeholder: "Pet Age",
                    icon: Icons.calendar_month,
                    isObscure: false,
                    controller: _petAgeController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    placeholder: "Pet Owner Phone",
                    icon: Icons.phone,
                    isObscure: false,
                    controller: _petOwnerPhoneController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    placeholder: "Pet Image URL",
                    icon: Icons.image,
                    isObscure: false,
                    controller: _petImageLinkController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    placeholder: "Pet Details",
                    icon: Icons.density_medium_sharp,
                    isObscure: false,
                    controller: _petDetailsController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    child: Column(
                      children: [
                        Text("Emergency" , style: TextStyle(color: Colors.red , fontWeight: FontWeight.bold , fontSize: 22,),),
                        SizedBox(height: 10,),
                        Text('Vatsalya  Animal Care Trust, Shaktinagar - 88670 21053'),
                         SizedBox(height: 10,),
                        Text('Mangalore Rescues - WILDLIFE - 8618190692'),
                         SizedBox(height: 10,),
                        Text('Sri Venkatramana Gow Shala Trust(R.) - 90087 17352'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 30,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<HomeBloc>(context).add(
                          RescueFormSubmitEvent(name: _petNameController.text, type: _petTypeController.text, age:_petAgeController.text, phone: _petOwnerPhoneController.text, image: _petImageLinkController.text, description: _petDetailsController.text,),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Upload",
                        style: GoogleFonts.varelaRound(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
