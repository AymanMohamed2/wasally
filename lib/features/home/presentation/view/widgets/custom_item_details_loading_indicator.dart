import 'package:flutter/material.dart';

class CustomItemDetailsLoadingIndicator extends StatelessWidget {
  const CustomItemDetailsLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: ListTile(
        // title: Text(document!.name!),
        // subtitle: Text(document!.address!),
        leading: SizedBox(
            height: 40,
            width: 40,
            child: Container(
              color: Colors.grey,
            )),
        trailing: const Icon(
          Icons.shopping_cart_outlined,
          color: Colors.grey,
        ),
      ),
    );
  }
}
