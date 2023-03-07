import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:jpb_project/utils/colors.dart';

import '../utils/car_product.dart';

class CategoryScreen extends StatelessWidget {
  String catogery;
  CategoryScreen({super.key, required this.catogery});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: UiColors.customColor,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,

            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child:const Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                    ),
                    Text(
                      catogery,
                      style:const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    Neumorphic(
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(12),
                        ),
                        color: UiColors.customColor,
                        intensity: 1,
                      ),
                      child: const Center(
                        child: Padding(
                          padding:  EdgeInsets.all(10),
                          child: Icon(
                            CupertinoIcons.cart_fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
             const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Neumorphic(
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(20),
                      ),
                      color: UiColors.customColor,
                      intensity: 1,
                    ),
                    child: Padding(
                      padding:
                        const  EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                      child: Row(
                        children: const [
                          Icon(Icons.sort),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Sort",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Neumorphic(
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(20),
                      ),
                      color: UiColors.customColor,
                      intensity: 1,
                    ),
                    child: Padding(
                      padding:
                         const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                      child: Row(
                        children: const [
                          Icon(Icons.filter_list),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Filter",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding:
                     const EdgeInsets.only(top: 20, right: 5, left: 5, bottom: 50),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio:
                        (MediaQuery.of(context).size.width - 15 - 10) /
                            (2 * 250),
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 5,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    if (index % 2 == 0) {
                      return CatProductCard(
                        index: index,
                      );
                    }
                    return OverflowBox(
                      maxHeight: 250 + 70,
                      child: Container(
                        margin: const EdgeInsets.only(top: 70),
                        child: CatProductCard(
                          index: index,
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
