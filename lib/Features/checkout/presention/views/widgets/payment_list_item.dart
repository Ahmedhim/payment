import 'package:flutter/material.dart';

import '../../../../../Core/widgets/custom_payment_item.dart';

class PaymentListItem extends StatefulWidget {
  const PaymentListItem({super.key});

  @override
  State<PaymentListItem> createState() => _PaymentListItemState();
}

class _PaymentListItemState extends State<PaymentListItem> {
  int currentindex = 0;
  List<String> images = const [
    "assets/creditcard.png",
    "assets/Group.png",
    "assets/SVGRepo_iconCarrier.png"
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                currentindex = index;
                setState(() {});
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: CustomPaymentItem(
                  image: images[index],
                  isActive: currentindex == index,
                ),
              ),
            ));
  }
}
