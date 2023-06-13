import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'edit_profile/edit_profile.dart';
import 'forgot_password/forgot_password_one.dart';
import 'forgot_password/forgot_password_three.dart';
import 'forgot_password/forgot_password_two.dart';
import 'registration_research_project/registration_research_project.dart';
import 'research_projects/research_project/research_project.dart';
import 'splash_screen/splash_screen.dart';
import 'principal/principal.dart';
import 'login/login.dart';
import 'register/register.dart';
import 'util/theme.dart';
import 'util/routes.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    return GetMaterialApp(
      title: 'Neumann',
      theme: theme,
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: Routes.login,
          page: () => const Login(),
        ),
        GetPage(
          name: Routes.forgotPasswordOne,
          page: () => ForgotPasswordOne(),
          transition: Transition.fade,
          transitionDuration: const Duration(
            milliseconds: 200,
          ),
        ),
        GetPage(
          name: Routes.forgotPasswordTwo,
          page: () => ForgotPasswordTwo(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(
            milliseconds: 300,
          ),
        ),
        GetPage(
          name: Routes.forgotPasswordThree,
          page: () => ForgotPasswordThree(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(
            milliseconds: 300,
          ),
        ),
        GetPage(
          name: Routes.register,
          page: () => const Register(),
          transition: Transition.downToUp,
          transitionDuration: const Duration(
            milliseconds: 200,
          ),
        ),
        GetPage(
          name: Routes.principal,
          page: () => Principal(),
        ),
        GetPage(
          name: Routes.registrationResearchProject,
          page: () =>
              const RegistrationResearchProject(name: 'Cadastrar Projeto'),
        ),
        GetPage(
          name: Routes.researchProject,
          page: () => ResearchProject(),
          transition: Transition.downToUp,
          transitionDuration: const Duration(
            milliseconds: 200,
          ),
        ),
        GetPage(
          name: Routes.editResearchProject,
          page: () => const RegistrationResearchProject(name: 'Editar projeto'),
          transition: Transition.downToUp,
          transitionDuration: const Duration(
            milliseconds: 200,
          ),
        ),
        GetPage(
          name: Routes.editProfile,
          page: () => const EditProfile(),
        ),
      ],
    );
  }
}
