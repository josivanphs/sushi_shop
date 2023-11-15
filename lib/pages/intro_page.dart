import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_shop/components/button.dart';
import 'package:sushi_shop/theme/colors.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 25,
            ),
            //shop name
            Text(
              'SUSHI PONTA NEGRA',
              style:
                  GoogleFonts.dmSerifDisplay(fontSize: 28, color: Colors.white),
            ),
            const SizedBox(
              height: 25,
            ),

            // icon
            Padding(
              padding: const EdgeInsets.all(50),
              child: Image.asset('assets/icon.png'),
            ),
            const SizedBox(
              height: 25,
            ),

            //title
            Text(
              'Sabor do Oriente em Cada Toque',
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            //subtitle
            Text(
              'Desfrute da Arte do Sabor Oriental na Palma da Sua Mão',
              style: TextStyle(color: Colors.grey[300], height: 2),
            ),
            const SizedBox(
              height: 25,
            ),

            //get started button

            MyButton(
              text: 'Inicar',
              onTap: () {
                // go to menu page
                Navigator.pushNamed(context, '/menupage');
              },
            )
          ],
        ),
      ),
    );
  }
}
