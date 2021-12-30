import 'package:flutter/material.dart';
import 'package:onboarding_demo/models/home/categories/categories_model_MEN.dart';

class Categories_List_Men extends StatelessWidget {
  const Categories_List_Men({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 215,
      width: size.width,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: categoriesMEN.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // số lượng hình ảnh muốn đẩy lên
          childAspectRatio: 0.75,
          mainAxisSpacing: 0, // khoảng cách trên dưới
          crossAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage(categoriesMEN[index].image),
                    ),
                    Text(categoriesMEN[index].name),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
