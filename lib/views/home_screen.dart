import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:jpb_project/views/catogries_screen.dart';
import 'package:jpb_project/utils/colors.dart';
import 'package:jpb_project/utils/widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List categories = [
      "Chairs",
      "Beds",
      "Sofas",
      "Doors",
      "Windows",
      "Tables",
    ];
    List photos = [
      "assets/Product 1 .png",
      "assets/Product 2 .png",
      "assets/Product 3 .png",
      "assets/Product 4 .png"
    ];
    return DefaultTabController(
      length: 4,
      child: Material(
        color: const Color(0xFFF3F6FD),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 5, left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     const Text(
                        "Our Product",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Neumorphic(
                          // onPressed: () {},
                          style: NeumorphicStyle(
                            shape: NeumorphicShape.flat,
                            boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(15),
                            ),
                            color: UiColors.customColor,
                            intensity: 3,
                          ),
                          child: const Padding(
                            padding:  EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.search,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                 const SizedBox(
                    height: 20,
                  ),
                const  TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.black54,
                      labelColor: Colors.black,
                      isScrollable: true,
                      labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      tabs: [
                        Tab(
                          text: "Chairs",
                        ),
                        Tab(
                          text: "Sofas",
                        ),
                        Tab(
                          text: "Beds",
                        ),
                        Tab(
                          text: "Tables",
                        ),
                      ]),
                 const SizedBox(
                    height: 20,
                  ),
                 const SizedBox(
                    height: 360,
                    child: TabBarView(children: [
                      ProductWidget(), //tab 1
                      ProductWidget(), //tab 2
                      ProductWidget(), //tab 3
                      ProductWidget(), //tab 4
                    ]),
                  ),
                 const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 70,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryScreen(
                                  catogery: categories[index],
                                ),
                              ),
                            );
                          },
                          child: Neumorphic(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 25),
                            style: NeumorphicStyle(
                              shape: NeumorphicShape.flat,
                              boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(20),
                              ),
                              color: UiColors.customColor,
                              intensity: 1,
                            ),
                            child: Center(
                              child: Text(
                                categories[index],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                const  SizedBox(
                    height: 10,
                  ),
                 const Text(
                    "Best Offers",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: photos.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          minLeadingWidth: 70,
                          leading: Image.asset(photos[index]),
                          title: const Text(
                            "Product Name",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
                            ),
                          ),
                          subtitle: const Text(
                            "Category",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black38,
                            ),
                          ),
                          trailing: const Text(
                            "\$233",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
