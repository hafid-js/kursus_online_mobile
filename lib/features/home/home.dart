import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kursus_online_mobile/common/widgets/images/circular_image.dart';
import 'package:kursus_online_mobile/common/widgets/texts/section_heading.dart';
import 'package:kursus_online_mobile/constants/colors.dart';
import 'package:kursus_online_mobile/constants/helpers/hex_color.dart';
import 'package:kursus_online_mobile/features/home/models/category_model.dart';
import 'package:kursus_online_mobile/features/home/widgets/category_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final double scrollSpeed = 1.0;
  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> categories = [
      CategoryModel(
        title: "Digital Marketing",
        course: "0 Course",
        icon: "assets/icons/category_icon_1.png",
      ),
      CategoryModel(
        title: "Health & Fitness",
        course: "1 Course",
        icon: "assets/icons/category_icon_2.png",
      ),
      CategoryModel(
        title: "Motion Graphics",
        course: "0 Course",
        icon: "assets/icons/category_icon_3.png",
      ),
      CategoryModel(
        title: "HTML & CSS",
        course: "3 Course",
        icon: "assets/icons/category_icon_4.png",
      ),
      CategoryModel(
        title: "Adobe Illustrator",
        course: "7 Course",
        icon: "assets/icons/category_icon_5.png",
      ),
      CategoryModel(
        title: "Business Strategy",
        course: "7 Course",
        icon: "assets/icons/category_icon_6.png",
      ),
      CategoryModel(
        title: "Mobile App Design",
        course: "7 Course",
        icon: "assets/icons/category_icon_7.png",
      ),
      CategoryModel(
        title: "Development",
        course: "7 Course",
        icon: "assets/icons/category_icon_8.png",
      ),
    ];
    final List<String> universities = [
      "assets/images/university_1.png",
      "assets/images/university_2.png",
      "assets/images/university_3.png",
      "assets/images/university_4.png",
      "assets/images/university_5.png",
      "assets/images/university_6.png",
      "assets/images/university_7.png",
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      drawer: Drawer(
        width: 280,
        backgroundColor: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(left: 18, right: 18, top: 60),
          child: Column(
            children: [
              Row(
                children: [
                  Material(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                      side: BorderSide(color: UColors.grey, width: 1),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: Center(
                          child: Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.black,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Material(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                      side: BorderSide(color: UColors.grey, width: 1),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: Center(
                          child: Icon(
                            Icons.person_outline_outlined,
                            color: Colors.black,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: TextField(
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 16,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(color: UColors.grey, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(color: UColors.grey, width: 1),
                    ),
                    suffixIcon: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        print("Search icon ditekan!");
                      },
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.search,
                          color: HexColor.fromHex("#356DF1"),
                        ),
                      ),
                    ),
                  ),
                  onChanged: (value) => {},
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 115,
                    height: 35,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        backgroundColor: HexColor.fromHex("#356DF1"),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Menu",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 6),
                  SizedBox(
                    width: 115,
                    height: 35,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        backgroundColor: UColors.grey,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Categories",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      child: Text(
                        "Home",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                  Divider(height: 1, color: UColors.grey),

                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      child: Text(
                        "About Us",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                  Divider(height: 1, color: UColors.grey),

                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      child: Text(
                        "Courses",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                  Divider(height: 1, color: UColors.grey),

                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      child: Text(
                        "Blog",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                  Divider(height: 1, color: UColors.grey),

                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      child: Text(
                        "Contact Us",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                  Divider(height: 1, color: UColors.grey),
                ],
              ),
            ],
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: Stack(
                children: [
                  Positioned(
                    bottom: -40,
                    right: -80,
                    child: Container(
                      width: 220,
                      height: 220,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: HexColor.fromHex("#356DF1"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Premier E-Learning Courses From EduCore",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                "Nullam tincidunt tortor est, ac maximus justo gravida non phasellus dignissim quam odio ipsum sollicitudin rhoncus venenatis ex metus in turpis.",
                                style: TextStyle(fontSize: 10),
                              ),
                              SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 120,
                                    height: 40,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                        ),
                                        backgroundColor: HexColor.fromHex(
                                          "#356DF1",
                                        ),
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Start Free Trial",
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(width: 6),
                                            Icon(
                                              Icons.arrow_forward,
                                              size: 14,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: HexColor.fromHex(
                                        "#356DF1",
                                      ),
                                      shape: CircleBorder(),
                                      padding: EdgeInsets.all(10),
                                    ),
                                    child: Icon(
                                      Icons.play_arrow_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "See Our Lesson Showcase",
                                      style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          "assets/images/thumbnail-primary.png",
                          height: 165,
                          width: 120,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Card(
              color: HexColor.fromHex("#d5f8ef"),
              elevation: 0,
              child: Padding(
                padding: EdgeInsets.only(left: 6, top: 6, bottom: 6),
                child: Row(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: BorderSide(color: Colors.green, width: 0),
                      ),
                      elevation: 0,
                      color: HexColor.fromHex("#17b789"),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: Image.asset(
                          "assets/icons/sarjana.png",
                          width: 30,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Earn a Certificate",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "LMS allows users to create organize and manage courses.",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 4),
            Card(
              color: HexColor.fromHex("#ffe5f4"),
              elevation: 0,
              child: Padding(
                padding: EdgeInsets.only(left: 6, top: 6, bottom: 6),
                child: Row(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: BorderSide(color: Colors.green, width: 0),
                      ),
                      elevation: 0,
                      color: HexColor.fromHex("#d63384"),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: Image.asset(
                          "assets/icons/lencana.png",
                          width: 30,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Earn a Certificate",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "LMS allows users to create organize and manage courses.",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 4),
            Card(
              elevation: 0,
              color: HexColor.fromHex("#d8f6ff"),
              child: Padding(
                padding: EdgeInsets.only(left: 6, top: 6, bottom: 6),
                child: Row(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: Colors.green, width: 0),
                      ),
                      elevation: 0,
                      color: HexColor.fromHex("#0dcaf0"),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: Image.asset(
                          "assets/icons/video_screen.png",
                          width: 30,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Features 5400+ Courses",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "LMS allows users to create organize and manage courses.",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 12),
            USectionHeading(title: "Categories"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 2,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  final item = categories[index];

                  return CategoryCard(
                    title: item.title,
                    course: item.course,
                    icon: item.icon,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 100,
                right: 100,
                bottom: 30,
                top: 0,
              ),
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Nanti buat lihat categories"),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: HexColor.fromHex("#356DF1"),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "View All Categories",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 6),
                    Icon(Icons.arrow_forward_ios_rounded, size: 12),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 310,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 8),
                  ...List.generate(5, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Container(
                        width: 190,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          border: BoxBorder.fromBorderSide(
                            BorderSide(color: UColors.grey),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(12),
                                  ),
                                  child: Image.asset(
                                    "assets/images/course_image_test.jpg",
                                    height: 120,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 16,
                                  left: 120,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: HexColor.fromHex("#356DF1"),
                                      borderRadius: BorderRadius.circular(4),
                                    ),

                                    width: 70,
                                    height: 18,

                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.watch_later_outlined,
                                          size: 12,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 2),
                                        Text(
                                          "9h 20m",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 6),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      ...List.generate(
                                        5,
                                        (i) => Icon(
                                          Icons.star_rounded,
                                          size: 12,
                                          color: i < 4
                                              ? Colors.yellow[700]
                                              : Colors.grey,
                                        ),
                                      ),
                                      SizedBox(width: 6),
                                      Text(
                                        "(4.0) Rating",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    "30 Days to Learning Flutter",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 6),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.my_library_books,
                                            size: 12,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            "5 Lessons",
                                            style: TextStyle(fontSize: 8),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 8),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.supervisor_account_outlined,
                                            size: 12,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            "1 Student",
                                            style: TextStyle(fontSize: 8),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 12),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      UCircularImage(
                                        image: "assets/images/instructor_8.jpg",
                                        isNetworkImage: false,
                                        height: 30,
                                        width: 30,
                                      ),
                                      SizedBox(width: 6),
                                      Text(
                                        "Kim Jong Un",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider(thickness: 1, color: Colors.grey[300]),

                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 32,
                                    child: OutlinedButton(
                                      onPressed: () {},
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        side: BorderSide(
                                          color: UColors.grey,
                                          width: 1,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12,
                                        ),
                                      ),
                                      child: Text(
                                        "Add to Cart",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),

                                  Spacer(),

                                  Text(
                                    "Rp.550.000",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                  SizedBox(width: 8),
                ],
              ),
            ),

            SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100, bottom: 30),
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Nanti buat lihat categories"),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: HexColor.fromHex("#356DF1"),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Browse More Courses",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 6),
                    Icon(Icons.arrow_forward_ios_rounded, size: 12),
                  ],
                ),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/offer_bg.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              height: 150,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/offer_img_1.png",
                    height: 150,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Eager to Receive Special Offers & Updates on Courses?",
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          cursorColor: HexColor.fromHex("#356DF1"),
                          style: TextStyle(color: Colors.white, fontSize: 14),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 12),
                            hintText: "Your Email Address ....",
                            hintStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),

                            suffixIcon: Padding(
                              padding: EdgeInsets.only(right: 4),
                              child: SizedBox(
                                width: 100,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Subscribe",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    backgroundColor: HexColor.fromHex(
                                      "#356DF1",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            suffixIconConstraints: BoxConstraints(
                              minWidth: 100,
                              minHeight: 8,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                height: 180,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(right: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Be a Member & Share Your Knowledge.",
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: HexColor.fromHex("#1e1e2f"),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                "LMS allows administrators and instructors to create, organize, and deliver courses. This includes uploading course content, managing materials, and setting assessments.",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: HexColor.fromHex("#787882"),
                                ),
                                textAlign: TextAlign.justify,
                              ),
                              SizedBox(height: 6),
                              SizedBox(
                                width: 200,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    backgroundColor: HexColor.fromHex(
                                      "#356DF1",
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Become An Instructor",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(width: 6),
                                      Icon(
                                        Icons.arrow_forward,
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          "assets/images/become_instructor.png",
                          height: 180,
                          width: 180,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 30),

            Column(
              children: [
                Text(
                  "Trusted by Over 24,758 Outstanding Teams",
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 40,
                    autoPlay: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 3000),
                    autoPlayInterval: Duration(milliseconds: 100),
                    autoPlayCurve: Curves.linear,
                    viewportFraction: 0.15,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: universities.map((imagePath) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: AssetImage(imagePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ],
            ),

            SizedBox(height: 30),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: Container(
                      height: 140,
                      width: 320,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: UColors.grey),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 13,
                          vertical: 13,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: List.generate(
                                5,
                                (i) => Icon(
                                  Icons.star_rounded,
                                  size: 18,
                                  color: i < 4
                                      ? Colors.yellow[700]
                                      : Colors.grey,
                                ),
                              ),
                            ),
                            SizedBox(height: 6),
                            Expanded(
                              child: Text(
                                "This course completely changed the way I approach programming. The lessons are clear, and the exercises are practical. Highly recommend!",
                                style: TextStyle(fontSize: 11),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),
                            SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                UCircularImage(
                                  image: "assets/images/instructor_8.jpg",
                                  isNetworkImage: false,
                                  height: 30,
                                  width: 30,
                                ),
                                SizedBox(width: 6),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Kim Jong Un",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Software Engineer",
                                      style: TextStyle(
                                        fontSize: 9,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: Container(
                      height: 140,
                      width: 320,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: UColors.grey),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 13,
                          vertical: 13,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: List.generate(
                                5,
                                (i) => Icon(
                                  Icons.star_rounded,
                                  size: 18,
                                  color: i < 4
                                      ? Colors.yellow[700]
                                      : Colors.grey,
                                ),
                              ),
                            ),
                            SizedBox(height: 6),
                            Expanded(
                              child: Text(
                                "This course completely changed the way I approach programming. The lessons are clear, and the exercises are practical. Highly recommend!",
                                style: TextStyle(fontSize: 11),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),
                            SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                UCircularImage(
                                  image: "assets/images/instructor_8.jpg",
                                  isNetworkImage: false,
                                  height: 30,
                                  width: 30,
                                ),
                                SizedBox(width: 6),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Kim Jong Un",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Software Engineer",
                                      style: TextStyle(
                                        fontSize: 9,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),
            USectionHeading(title: "Our Latest News Feed"),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(6),
                    child: Container(
                      height: 150,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        border: BoxBorder.all(color: UColors.grey, width: 1),
                      ),
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(6),
                                  bottomLeft: Radius.circular(6),
                                ),
                                child: Image.asset(
                                  "assets/images/news_1.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 8,
                                left: 8,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: HexColor.fromHex("#356DF1"),
                                    borderRadius: BorderRadius.circular(4),
                                  ),

                                  width: 80,
                                  height: 15,

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.calendar_month_outlined,
                                        size: 12,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 2),
                                      Text(
                                        "Aug 03,2026",
                                        style: TextStyle(
                                          fontSize: 8,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 18,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 6,
                                          vertical: 3,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                          border: BoxBorder.all(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(Iconsax.user, size: 10),
                                            SizedBox(width: 4),
                                            Text(
                                              "By Admin",
                                              style: TextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 6),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 6,
                                          vertical: 3,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                          border: BoxBorder.all(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(Iconsax.messages_2, size: 10),
                                            SizedBox(width: 4),
                                            Text(
                                              "0 Comments",
                                              style: TextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    "Be a Member & Share Your Knowledge.",
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: HexColor.fromHex("#1e1e2f"),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    "LMS allows administrators and instructors to create, organize, and deliver courses. This includes uploading course content, managing materials, and setting assessments.",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: HexColor.fromHex("#787882"),
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 10),
                                  Expanded(
                                    child: SizedBox(
                                      width: 100,
                                      height: 30,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              6,
                                            ),
                                          ),
                                          backgroundColor: HexColor.fromHex(
                                            "#356DF1",
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Read More",
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(width: 6),
                                            Icon(
                                              Icons.arrow_forward,
                                              size: 16,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 6),
                  Padding(
                    padding: EdgeInsets.all(6),
                    child: Container(
                      height: 150,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        border: BoxBorder.all(color: UColors.grey, width: 1),
                      ),
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(6),
                                  bottomLeft: Radius.circular(6),
                                ),
                                child: Image.asset(
                                  "assets/images/news_1.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 8,
                                left: 8,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: HexColor.fromHex("#356DF1"),
                                    borderRadius: BorderRadius.circular(4),
                                  ),

                                  width: 80,
                                  height: 15,

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.calendar_month_outlined,
                                        size: 12,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 2),
                                      Text(
                                        "Aug 03,2026",
                                        style: TextStyle(
                                          fontSize: 8,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 18,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 6,
                                          vertical: 3,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                          border: BoxBorder.all(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(Iconsax.user, size: 10),
                                            SizedBox(width: 4),
                                            Text(
                                              "By Admin",
                                              style: TextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 6),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 6,
                                          vertical: 3,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                          border: BoxBorder.all(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(Iconsax.messages_2, size: 10),
                                            SizedBox(width: 4),
                                            Text(
                                              "0 Comments",
                                              style: TextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    "Be a Member & Share Your Knowledge.",
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: HexColor.fromHex("#1e1e2f"),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    "LMS allows administrators and instructors to create, organize, and deliver courses. This includes uploading course content, managing materials, and setting assessments.",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: HexColor.fromHex("#787882"),
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 10),
                                  Expanded(
                                    child: SizedBox(
                                      width: 100,
                                      height: 30,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              6,
                                            ),
                                          ),
                                          backgroundColor: HexColor.fromHex(
                                            "#356DF1",
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Read More",
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(width: 6),
                                            Icon(
                                              Icons.arrow_forward,
                                              size: 16,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),
            Container(
              color: Colors.white,
              height: 30,
              width: MediaQuery.of(context).size.width,
            ),
          ],
        ),
      ),
    );
  }
}
