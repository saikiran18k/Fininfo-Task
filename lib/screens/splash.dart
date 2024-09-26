import '../app_imports/app_constant_imports.dart';
import '../app_imports/app_default_imports.dart';
import 'task.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    nav();
  }

  nav() async {
  await Future.delayed(
    const Duration(seconds: 3),
  );

  if (mounted) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const NumberGridScreen(),
      ),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color: white,
          image: DecorationImage(
            image: AssetImage(
              Images().bgImg,
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              blue.withOpacity(.9),
              BlendMode.srcATop,
            ),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              blue,
              blue.withOpacity(0.9),
            ],
          ),
        ),
        child: Column(
          children: [
            const Spacer(flex: 2),
            Image.asset(
              Images().appIcon,
              color: white,
              width: size.width * .3,
            ),
            const SizedBox(height: 20,),
            Text(
              "Number System",
              style: Fonts().applogo(context).copyWith(
                    color: white,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w900,
                  ),
            ),
            const SizedBox(height: 10,),
            Text(
              "In a Grid View",
              style: Fonts().h4l(context).copyWith(
                    color: white,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const Spacer(
              flex: 3,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 05,
              ),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: RichText(
                text: TextSpan(
                  text: 'Powered By ',
                  style: Fonts().h4l(context).copyWith(
                        color: black,
                      ),
                  children: [
                    TextSpan(
                      text: 'SaiKiran',
                      style: Fonts().h4l(context).copyWith(
                            color: red,
                            fontWeight: FontWeight.w900,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * .02,
            ),
          ],
        ),
      ),
    );
  }
}
