import 'package:flutter/material.dart';
import 'package:pi_app/data/Anim.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _controller = PageController(
    initialPage: 0,
  );
  int currentPage= 1;
  double titleOpacity = 1;
  List<Anim> anims = [
    Anim(
      title: "Despicable Me",
      subtitle: "characters",
      name: "Kevin",
      bgColor: "#FFA500",
      imageUrl: "miki.png",
    ),
    Anim(
      title: "Despicable Me",
      subtitle: "characters",
      name: "Agnes",
      bgColor: "#FFA500",
      imageUrl: "dambo.png",
    ),
    Anim(
      title: "Despicable Me",
      subtitle: "characters",
      name: "Agnes",
      bgColor: "#FFA500",
      imageUrl: "dambo.png",
    )
  ];

  @override
  void initState() {
    _controller.addListener(() {
      print("offset: ${_controller.offset}");
      print("total: ${((currentPage-1)*2)-(_controller.offset/(MediaQuery.of(context).size.width/2.0))}");
      //titleOpacity = 1-(_controller.offset/(MediaQuery.of(context).size.width/2)/currentPage);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.black,
          ),
        ],
      ),
      body: PageView(
        controller: _controller,
        onPageChanged: (page){
          setState(() {
            currentPage=page+1;
          });
        },
        children: [for (var anim in anims) _buildPage(anim)],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildPage(Anim anim) {
    return Column(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${anim.title}",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(titleOpacity)),
                ),
                Text(
                  "${anim.subtitle}",
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
        ),
        Stack(
          children: [
            Positioned(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.1, 0.5, 0.7, 0.9],
                    colors: [
                      Colors.yellow[800],
                      Colors.yellow[700],
                      Colors.yellow[600],
                      Colors.yellow[400],
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                right: 0,
                left: 0,
                bottom:  MediaQuery.of(context).size.height * 0.2,
                child: Image.asset("assets/images/${anim.imageUrl}",height: MediaQuery.of(context).size.height * 0.3,)),
            Positioned(
              bottom: 20,
              left: 10,
              child: Column(
                children: [
                  Text(
                    "${anim.name}",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  Text(
                    "Tap to Read more",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
