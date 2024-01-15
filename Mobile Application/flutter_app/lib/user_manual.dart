import 'package:flutter/material.dart';

class UserGuide extends StatefulWidget {
  const UserGuide({super.key});

  @override
  State<UserGuide> createState() => _UserGuideState();
}

class _UserGuideState extends State<UserGuide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20.0, bottom: 20.0),
              child: Text(
                "User Guide",
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  
                ),
              ),
            ),
            //Divider(height: 0.2,),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20.0, bottom: 10.0),
              child: Text(
                'Dear Gentle Owner ,',
                style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: Text(
                'Welcome to a world where your plants thrive with just a touch! HydroGroPro is not just an app; it is your gardening companion, your plant\'s best friend. Get ready to embark on a journey of effortless plant care, where every tap brings you closer to greener, healthier spaces. This user manual is your guide to unlocking the full potential of your HydroGroPro app. Let\'s cultivate success together!',
                style: TextStyle(
                  fontSize: 12.0,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
           // Divider(height: 0.2,),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20.0, bottom: 10.0),
              child: Text(
                '- Profile',
                style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'Poppins',
                  color: Color(0xFF0D7817),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: Text(
                  'Dive into the heart of your gardening realm. Update your credentials, swap your password like a secret handshake, and throw in a profile picture because your plants deserve to know their caregiver!',
                style: TextStyle(
                  fontSize: 12.0,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
           // Divider(height: 0.2,),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20.0, bottom: 10.0),
              child: Text(
                '- Plant Log',
                style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'Poppins',
                  color: Color(0xFF0D7817),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: Text(
                  'Behold the gateway to your hydroponic haven! Hit \'GO TO STATUS\' to witness real-time pH and Nutrient values. No worries – if things go haywire, our vigilant system pumps into action, and you\'re the first to know! Meet your leafy companions here, each with a story to tell.',
                style: TextStyle(
                  fontSize: 12.0,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            //Divider(height: 0.2,),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20.0, bottom: 10.0),
              child: Text(
                '- Add A New Plant',
                style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'Poppins',
                  color: Color(0xFF0D7817),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: Text(
                  'Curiosity blooms in the \'Add a new plant\' page. Click the magic plus button, explore the menu – pick exotic plants or keep it chill with \'General Case\' for a bit of everything. Your hydroponic canvas, your rules!',
                style: TextStyle(
                  fontSize: 12.0,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            //Divider(height: 0.2,),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20.0, bottom: 10.0),
              child: Text(
                '- Plant Details',
                style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'Poppins',
                  color: Color(0xFF0D7817),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: Text(
                  'Want to unravel the secrets of a specific plant? Click its name in the Plant Log, and voila! You\'re in the enchanted garden of plant details.',
                style: TextStyle(
                  fontSize: 12.0,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            //Divider(height: 0.2,),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20.0, bottom: 10.0),
              child: Text(
                'Brace yourself, dear gardener, for a blooming adventure with HydroGroPro. Your plants are in good hands, and so are you!',
                style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top:20.0,left: 20.0, right: 20.0),
                child: Text(
                    'Happy Gardening !!!',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top:10.0,left: 20.0, right: 20.0, bottom: 40.0),
                child: Text(
                    'The HydroGroPro Team 🌿✨',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}