import 'package:flutter/material.dart';
import 'package:profile_page/EducationApp/data/data.dart';

import 'course_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    //responsive text sizes
    final textScaleFactor = size.width / 400;

    //apply responsive text theme
    final responsiveTextTheme = theme.textTheme.copyWith(
      displayLarge: theme.textTheme.displayLarge!.copyWith(
        fontSize: 28 * textScaleFactor,
      ),
      displayMedium: theme.textTheme.displayMedium!.copyWith(
        fontSize: 22 * textScaleFactor,
      ),
      bodyLarge: theme.textTheme.bodyLarge!.copyWith(
        fontSize: 16 * textScaleFactor,
      ),
      bodyMedium: theme.textTheme.bodyMedium!.copyWith(
        fontSize: 14 * textScaleFactor,
      ),
    );

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      extendBody: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: size.width * 0.03,
                    horizontal: size.width * 0.03,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: theme.colorScheme.primary.withOpacity(0.05),
                        blurRadius: 20,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome Sai',
                            style: responsiveTextTheme.displayMedium,
                          ),
                          Text(
                            'What do you want to learn today?',
                            style: responsiveTextTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              theme.colorScheme.primary,
                              theme.colorScheme.secondary,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(
                            size.width * 0.06,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: theme.colorScheme.primary.withOpacity(0.3),
                              blurRadius: 12,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: size.width * 0.08,
                          backgroundColor: Colors.transparent,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 15,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for courses',
                      hintStyle: TextStyle(
                        fontSize: 14 * textScaleFactor,
                        color: theme.colorScheme.onSurface.withOpacity(0.5),
                      ),
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.search,
                        color: theme.colorScheme.primary,
                        size: 22 * textScaleFactor,
                      ),
                      suffixIcon: Container(
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.tune,
                          color: theme.colorScheme.primary,
                          size: 18 * textScaleFactor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: responsiveTextTheme.displayMedium,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.03,
                        vertical: size.width * 0.01,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'See all ',
                        style: TextStyle(
                          color: theme.colorScheme.primary,
                          fontSize: 12 * textScaleFactor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: size.width > 600 ? 4 : 3,
                    childAspectRatio: 1,
                    crossAxisSpacing: size.width * 0.03,
                    mainAxisSpacing: size.width * 0.03,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            theme.colorScheme.surface,
                            theme.colorScheme.surface.withOpacity(0.8),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: theme.colorScheme.primary.withOpacity(0.05),
                            blurRadius: 15,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: category.color.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  category.icon,
                                  color: category.color,
                                  size: 24 * textScaleFactor,
                                ),
                              ),
                              SizedBox(height: 8 * textScaleFactor),
                              Text(
                                category.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14 * textScaleFactor,
                                  fontWeight: FontWeight.w600,
                                  color: theme.colorScheme.onBackground,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Trending Courses',
                      style: responsiveTextTheme.displayMedium,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CourseScreen(),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.width * 0.01,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'See all ',
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                            fontSize: 12 * textScaleFactor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      double screenWidth = constraints.maxWidth;
                      double cardWidth = screenWidth * 0.7;
                      double padding = screenWidth * 0.04;
                      double iconSize = screenWidth * 0.2;
                      double playButtonSize = screenWidth * 0.1;
                      double textScale = MediaQuery.of(context).textScaleFactor;

                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: trendingCourses.length,
                        itemBuilder: (context, index) {
                          final course = trendingCourses[index];

                          return Container(
                            width: cardWidth,
                            margin: EdgeInsets.only(right: padding),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  theme.colorScheme.surface,
                                  theme.colorScheme.surface.withOpacity(0.9),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: [
                                BoxShadow(
                                  color: theme.colorScheme.primary.withOpacity(
                                    0.05,
                                  ),
                                  blurRadius: 15,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: cardWidth * 0.47,
                                  padding: EdgeInsets.all(padding),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        course.color,
                                        course.color.withOpacity(0.8),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(24),
                                      topRight: Radius.circular(24),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: course.color.withOpacity(0.3),
                                        blurRadius: 15,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Icon(
                                          course.icon,
                                          color: Colors.white.withOpacity(0.6),
                                          size: iconSize,
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        left: 0,
                                        child: Container(
                                          height: playButtonSize,
                                          width: playButtonSize,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(
                                                  0.2,
                                                ),
                                                blurRadius: 10,
                                                offset: Offset(0, 4),
                                              ),
                                            ],
                                          ),
                                          child: Icon(
                                            Icons.play_arrow,
                                            color: course.color,
                                            size: playButtonSize * 0.6,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: padding * 0.5,
                                            vertical: padding * 0.3,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(
                                                  0.1,
                                                ),
                                                blurRadius: 5,
                                                offset: Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: course.color,
                                                size: 16 * textScale,
                                              ),
                                              SizedBox(width: 4),
                                              Text(
                                                course.rating,
                                                style: TextStyle(
                                                  fontSize: 12 * textScale,
                                                  fontWeight: FontWeight.bold,
                                                  color: course.color,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(padding),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        course.title,
                                        style: TextStyle(
                                          fontSize: 16 * textScale,
                                          fontWeight: FontWeight.bold,
                                          color: theme.colorScheme.onBackground,
                                        ),
                                      ),
                                      SizedBox(height: padding * 0.2),
                                      Text(
                                        course.subtitle,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 12 * textScale,
                                          color: theme.colorScheme.onBackground
                                              .withOpacity(0.6),
                                        ),
                                      ),
                                      SizedBox(height: padding * 0.5),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.access_time,
                                            color: theme.colorScheme.primary,
                                            size: 14 * textScale,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            course.lessons,
                                            style: TextStyle(
                                              fontSize: 12 * textScale,
                                              color: theme.colorScheme.primary,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
