import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SnapServiceHome extends StatelessWidget {
  int selectedIndex = 0;
  final List<String> tabs = [
    "ALL",
    "On Going Works",
    "Completed Works",
    "something else",
  ];
  SnapServiceHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.lerp(Color(0xFFFF6F51), Colors.white, 0.9)!,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "SnapServe.",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Color(0xFFFA6F51),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.add, color: Colors.white),
                        ),

                        Container(
                          height: 35, // square size
                          width: 35,
                          decoration: BoxDecoration(
                            color: Colors.white, // background color
                            borderRadius: BorderRadius.circular(
                              10,
                            ), // curved corners
                          ),
                          child: Icon(
                            Icons
                                .notifications_outlined, // your custom icon color
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.02),
                      blurRadius: 15,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'What service do you need ?',
                    hintStyle: TextStyle(fontSize: 14),
                    border: InputBorder.none,
                    icon: Icon(Icons.search, size: 24),
                    suffixIcon: Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color:
                            Color.lerp(Color(0xFFFF6F51), Colors.white, 0.8)!,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.tune,
                        size: 18,
                        color: Color(0xffDA4B2C),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(tabs.length, (index) {
                    final isSelected = selectedIndex == index;
                    return GestureDetector(
                      onTap: () {},
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 250),
                        margin: EdgeInsets.symmetric(horizontal: 6),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color:
                              !isSelected
                                  ? Color.lerp(
                                    Color(0xFFFF6F51),
                                    Colors.white,
                                    0.8,
                                  )!
                                  : null, // Remove color when gradient is used
                          gradient:
                              isSelected
                                  ? LinearGradient(
                                    colors: [
                                      Color(0xFFDA4B2C),
                                      Color(0xFFFF6F51),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  )
                                  : null,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow:
                              isSelected
                                  ? [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                    ),
                                  ]
                                  : [],
                        ),
                        child: Text(
                          tabs[index],
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
