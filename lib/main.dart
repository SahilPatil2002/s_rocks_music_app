import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_rocks_music_app/controllers/service_controller.dart';
import 'package:s_rocks_music_app/screens/service_detail_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController taskController = TextEditingController();
  final ServiceController serviceController = Get.put(ServiceController());

  int _selectedIndex = 0;

  final List<String> _titles = ["Home", "News", "TrackBox", "Projects"];
  final List<String> _icons = [
    "assets/icons/home.png",
    "assets/icons/news.png",
    "assets/icons/trackbox.png",
    "assets/icons/projects.png",
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(24, 23, 28, 1),
      body: Column(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * 0.40,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color.fromRGBO(86, 1, 33, 1),
                  Color.fromRGBO(169, 1, 63, 1),
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 50),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(47, 47, 57, 1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          height: 55,
                          child: Row(
                            children: [
                              Icon(Icons.search, color: Colors.white, size: 30),
                              SizedBox(width: 8),
                              Expanded(
                                child: TextField(
                                  cursorColor: Colors.white,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: "Search 'Punjabi Lyrics'",
                                    hintStyle: TextStyle(
                                      color: Color.fromRGBO(88, 88, 98, 1),
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              Icon(Icons.mic, color: Colors.white),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person_outline, size: 35),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Claim your",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Syne",
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Free Demo",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Lobster",
                    fontSize: 45,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      height: MediaQuery.sizeOf(context).height * 0.13,
                      width: MediaQuery.sizeOf(context).width * 0.24,
                      alignment: Alignment.centerLeft,
                      child: Transform.translate(
                        offset: Offset(-20, 0),
                        child: OverflowBox(
                          maxWidth: 150,
                          child: Image.asset(
                            'assets/images/cd.png',
                            width: 120,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.sizeOf(context).height * 0.13,
                      width: MediaQuery.sizeOf(context).width * 0.52,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "for custom Music Production",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: "Syne",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "Book Now",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Syne",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.sizeOf(context).height * 0.13,
                      width: MediaQuery.sizeOf(context).width * 0.24,
                      alignment: Alignment.centerRight,
                      child: Transform.translate(
                        offset: Offset(20, 0),
                        child: OverflowBox(
                          maxWidth: 150,
                          child: Image.asset(
                            'assets/images/piano.png',
                            width: 120,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16.0,
            ),
            child: Text(
              "Hire hand-picked Pros for popular music services",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: "Syne",
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (serviceController.services.isEmpty) {
                return Center(child: CircularProgressIndicator());
              }

              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: ListView.builder(
                  itemCount: serviceController.services.length,
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  itemBuilder: (context, index) {
                    final service = serviceController.services[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => ServiceDetailScreen(title: service.title));
                      },
                      child: Card(
                        color: Color(0xFF2C2C35),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: AssetImage(service.image),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                Color.fromRGBO(32, 33, 38, 0.9),
                                BlendMode.darken,
                              ),
                            ),
                          ),
                          child: ListTile(
                            leading: Image.asset(
                              service.icon,
                              width: 40,
                              height: 40,
                            ),
                            title: Text(
                              service.title,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Syne",
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1,
                              ),
                            ),
                            subtitle: Text(
                              service.description,
                              style: TextStyle(color: Colors.white70),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 4, bottom: 10),
        decoration: const BoxDecoration(
          color: Color(0xFF1E1E26),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_icons.length, (index) {
            final isSelected = _selectedIndex == index;

            return GestureDetector(
              onTap: () => _onTabTapped(index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Ellipse Indicator
                  if (isSelected)
                    Transform.translate(
                      offset: Offset(0, -10),
                      child: ClipRect(
                        child: Align(
                          alignment: Alignment.topCenter,
                          // heightFactor: 0.5, // Show only top half of image
                          child: Image.asset(
                            'assets/icons/ellips.png', // replace with your path
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                    )
                  else
                    SizedBox(height: 10), // Keep height same for layout balance

                  const SizedBox(height: 4),
                  // Icon
                  Image.asset(
                    _icons[index],
                    width: 28,
                    height: 28,
                    color: isSelected ? Colors.white : Colors.white60,

                  ),
                  const SizedBox(height: 4),
                  // Label
                  Text(
                    _titles[index],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : Colors.white60,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
