import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:jpb_project/views/product_screen.dart';

import 'colors.dart';

class CatProductCard extends StatelessWidget {
  int index;
  CatProductCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Neumorphic(
        style: NeumorphicStyle(
          shape: NeumorphicShape.flat,
          boxShape: NeumorphicBoxShape.roundRect(
            BorderRadius.circular(12),
          ),
          color: UiColors.customColor,
          intensity: 1,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProductScreen(),
                      ),
                    );
                  },
                  child: Image.asset("assets/Product ${index + 1} .png")),
              const Text(
                "Product Name",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black45,
                ),
              ),
              const Text(
                "\$233",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black45,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
