import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:sda_quo/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashDelay = 3;

  @override
  void initState() {
    super.initState();
    _loadWidget();
  }

  _loadWidget() async {
    var duration = Duration(seconds: splashDelay);
    await Future.delayed(duration);
    if (mounted) {
      _checkInternetConnection();
    }
  }

  void _checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      // No internet connection
      _showOfflineWidget();
    } else {
      // Internet connection is present
      _redirect();
    }
  }

  void _showOfflineWidget() {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Prevents dismissing the dialog by tapping outside
      builder: (context) => AlertDialog(
        title: const Icon(
          Icons.wifi_off,
          size: 60,
          color: Colors.red,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'You are offline',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _restartApp();
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'Retry',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _redirect() async {
    SharedPreferences vistor = await SharedPreferences.getInstance();
    if (vistor.getBool('seenIntro') == null) {
      _showIntro();
      vistor.setBool('seenIntro', true);
    } else {
      _navigateToHome();
    }
  }

  void _navigateToHome() {
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Home(title: 'pdf title'),
        ),
      );
    }
  }

  List<PageViewModel> pages = [
    PageViewModel(
      title: "Sabbath School Quarterly",
      body:
          "This app has been completely overhauled to enhance your experience. We hope you find this app a blessing and a source of strength.",
      image: const Center(
        child: Icon(Icons.waving_hand, size: 50.0),
      ),
    )
    // Add more pages as needed
  ];

  void _showIntro() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => IntroductionScreen(
          pages: pages,
          showNextButton: false,
          done: const Text(
            "Get Started",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          onDone: () => _navigateToHome(),
        ),
      ),
    );
  }

  void _restartApp() {
    // Restart the entire app
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Navigator.of(context).pop(); // Dismiss the previous dialog, if any
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        _showOfflineWidget(); // Show offline dialog if still no internet after retry
      } else {
        _redirect(); // Redirect if internet connection is present
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: const Image(
                    image: AssetImage(
                      'assets/Study.png',
                    ),
                  ),
                ),
              ),
              SpinKitWaveSpinner(
                color: Theme.of(context).colorScheme.primary,
                size: 80.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
