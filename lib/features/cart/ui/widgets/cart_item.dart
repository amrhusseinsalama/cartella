import 'package:flutter/material.dart';
import 'package:cartella/core/theming/colors.dart';

class CartItem extends StatelessWidget {
  final VoidCallback onPressedDelete;
  final String image;
  final String title;
  final String price;
  const CartItem({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.onPressedDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(image),
        title: Text(title),
        subtitle: Text("$price \$"),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: onPressedDelete,
              icon: Icon(Icons.delete),
              color: ColorsManager.mygray,
            ),
          ],
        ),
      ),
    );
  }
}

/* /* Widget counterCircleActioButton(IconData icon) {
 */  return CircleActionButton(
    icon: icon,
    iconColor: ColorsManager.mygray,
    onPressed: () {},
    backgroundColor: ColorsManager.mywhite,
  );
} */
/* Row(
              children: [
                counterCircleActioButton(Icons.remove),
                horizentalSpacing(10),
                Text("1"),
                horizentalSpacing(10),
                counterCircleActioButton(Icons.add),
              ],
            ), */
