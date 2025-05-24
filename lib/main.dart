import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Hire hand-picked Pros for popular music services",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: "Syne",
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Card(
                          child: ListTile(
                            leading: Icon(Icons.star, color: Colors.blue),
                            title: Text('Item ${index + 1}'),
                            subtitle: Text(
                              'This is the subtitle for item ${index + 1}',
                            ),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    child: Card(
                      child: ListTile(
                        leading: Icon(Icons.star, color: Colors.blue),
                        title: Text('Item ${index + 1}'),
                        subtitle: Text(
                          'This is the subtitle for item ${index + 1}',
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
      
    );
  }
}
