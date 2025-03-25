import 'package:flutter/material.dart';
import 'package:profile_page/JuiceApp/product_detail_screen.dart';

class HomePage extends StatelessWidget {
  List<Map<String, String>> categoryList = [
    {"title": "Avocado", "icon": "🥑"},
    {"title": "Mango", "icon": "🥭"},
    {"title": "Apple", "icon": "🍎"},
    {"title": "Grapes", "icon": "🍇"},
    {"title": "Banana", "icon": "🍌"},
  ];
  final String description =
      "Simply Juice offers a pure and refreshing taste, crafted from real fruit juice with no artificial flavors or preservatives. Made with high-quality ingredients";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            width: MediaQuery.sizeOf(context).width,
            height: 240,
            decoration: BoxDecoration(
              color: Color(0xffed828a),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(40.0),
              ),
            ),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              hintText: "Search Juices",
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: Icon(Icons.search),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white38,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_vert,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (var item in categoryList)
                            Column(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  margin: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ), // Rounded edges
                                  ),
                                  child: Center(
                                    child: Text(
                                      item["icon"]!, // FIX: Access the icon correctly
                                      style: TextStyle(
                                        fontSize: 24,
                                      ), // Bigger emoji
                                    ),
                                  ),
                                ),
                                Text(
                                  item["title"]!,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildItemView(
                  title: "Apple Juice",
                  description: description,
                  price: 13.99,
                  color: Color(0xfff58b95),
                  imagePath: "assets/images/juiceAppImages/apple.jpg",
                  radiusRequired: true,
                  context: context,
                ),
                _buildItemView(
                  title: "Lemon Juice",
                  description: description,
                  price: 12.65,
                  color: Color(0xfffdda2b),
                  imagePath: "assets/images/juiceAppImages/lemon.jpg",
                  context: context,
                ),
                _buildItemView(
                  title: "BlueBerry Juice",
                  description: description,
                  price: 15.10,
                  color: Color(0xffefd0ef),
                  imagePath: "assets/images/juiceAppImages/blueberry.jpg",
                  context: context,
                ),
                _buildItemView(
                  title: "Pomegranate Juice",
                  description: description,
                  price: 14.23,
                  color: Color(0xffff9c96),
                  imagePath: "assets/images/juiceAppImages/apple.jpg",
                  context: context,
                ),
                _buildItemView(
                  title: "Apple Juice",
                  description: description,
                  price: 13.99,
                  color: Color(0xfff58b95),
                  imagePath: "assets/images/juiceAppImages/apple.jpg",
                  radiusRequired: true,
                  context: context,
                ),
                _buildItemView(
                  title: "Lemon Juice",
                  description: description,
                  price: 12.65,
                  color: Color(0xfffdda2b),
                  imagePath: "assets/images/juiceAppImages/lemon.jpg",
                  context: context,
                ),
                _buildItemView(
                  title: "BlueBerry Juice",
                  description: description,
                  price: 15.10,
                  color: Color(0xffefd0ef),
                  imagePath: "assets/images/juiceAppImages/blueberry.jpg",
                  context: context,
                ),
                _buildItemView(
                  title: "Pomegranate Juice",
                  description: description,
                  price: 14.23,
                  color: Color(0xffff9c96),
                  imagePath: "assets/images/juiceAppImages/apple.jpg",
                  context: context,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildItemView({
  required String title,
  required String description,
  required double price,
  required Color color,
  required String imagePath,
  bool? radiusRequired,
  required BuildContext context,
}) {
  bool b = radiusRequired ?? false;
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) => ProductDetailsScreen(
                title: title,
                description: description,
                price: price,
                color: color,
                imagePath: imagePath,
              ),
        ),
      );
    },
    child: Container(
      height: 170,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: detail_widget(
              title: title,
              price: price,
              color: color,
              description: description,
              isTitleBelow: false,
            ),
          ),

          Expanded(
            flex: 2,
            child: Container(
              width: 80,
              decoration: BoxDecoration(
                color: Color(0xfffdf8f4),
                borderRadius:
                    radiusRequired != null
                        ? BorderRadius.only(topLeft: Radius.circular(30))
                        : null,
              ),
              height: double.maxFinite,
              child: Container(
                margin: EdgeInsets.only(top: 20),
                constraints: BoxConstraints(maxHeight: 200),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(2),
                child: FittedBox(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(70),
                    child: Image.asset(imagePath),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class detail_widget extends StatelessWidget {
  final String title;
  final String description;
  final double price;
  final Color color;
  final bool isTitleBelow;
  const detail_widget({
    required this.title,
    required this.description,
    required this.price,
    required this.color,
    required this.isTitleBelow,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          isTitleBelow == false
              ? Text(
                description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14),
              )
              : SizedBox(),
          // if (!isTitleBelow) ...[
          //   Text(
          //     description,
          //     maxLines: 2,
          //     overflow: TextOverflow.ellipsis,
          //     style: TextStyle(fontSize: 14),
          //   ),
          // ],
          Row(
            children: [
              Expanded(
                child: Text(
                  "\$ ${price}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 5,
                  bottom: 5,
                ),
                child: Row(
                  children: [
                    Icon(Icons.remove, color: Colors.white),
                    SizedBox(width: 5),
                    Text("1", style: TextStyle(color: Colors.white)),
                    SizedBox(width: 3),
                    Icon(Icons.add, color: Colors.white),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
