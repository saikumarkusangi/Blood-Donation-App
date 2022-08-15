
import 'package:blood_donate/firebase_options.dart';
import 'package:blood_donate/pages/BloodRecipient/blood_recipient.dart';
import 'package:blood_donate/pages/Dashboard/dashboard.dart';
import 'package:blood_donate/pages/Home/home_page.dart';
import 'package:blood_donate/pages/Profile/profile_page.dart';
import 'package:blood_donate/pages/after_donation/after_donation.dart';
import 'package:blood_donate/pages/before_donation/before_donation.dart';
import 'package:blood_donate/pages/createprofile/createProfile.dart';
import 'package:blood_donate/pages/history/history.dart';
import 'package:blood_donate/pages/login/login_page.dart';
import 'package:blood_donate/pages/welcome/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  //restrict landscape mode
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    //   providers:[],
    //   child: MaterialApp(
    return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/',
          getPages: [
            GetPage(
              name: '/',
              page: () => const WelcomePage(),
              transition: Transition.rightToLeftWithFade,
            ),
            GetPage(
              name: '/welcome',
              page: () => WelcomePage(),
              transition: Transition.rightToLeftWithFade,
            ),
            GetPage(
                name: '/profile',
                page: () => ProfilePage(),
                transition: Transition.rightToLeftWithFade),
                 GetPage(
                name: '/history',
                page: () => History(),
                transition: Transition.rightToLeftWithFade),
            GetPage(
                name: '/HomePage',
                page: () => HomePage(),
                transition: Transition.rightToLeftWithFade),
            GetPage(
                name: '/Dashboard',
                page: () => Dashboard(),
                transition: Transition.rightToLeftWithFade),
                 GetPage(
                name: '/BeforeDonation',
                page: () => PrecautionsBeforeDonation(),
                transition: Transition.rightToLeftWithFade),
                GetPage(
                name: '/AfterDonation',
                page: () => PrecautionsAfterDonation(),
                transition: Transition.rightToLeftWithFade),
                 GetPage(
                name: '/CreateProfile',
                page: () => CreateProfile(),
                transition: Transition.rightToLeftWithFade),
                //   GetPage(
                // name: '/recipient',
                // page: () => BloodRecipient(),
                // transition: Transition.rightToLeftWithFade),
          ],
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return HomePage();
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}')
                  );
                }
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return const WelcomePage();
            },
          )

          );
    
  }
}
