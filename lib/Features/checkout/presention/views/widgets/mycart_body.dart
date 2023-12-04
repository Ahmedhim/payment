import 'package:flutter/material.dart';
import 'package:payment_app/Core/constants.dart';
import 'package:payment_app/Core/widgets/Custom_button.dart';
import 'package:payment_app/Core/widgets/payment_bottom_sheet.dart';

class MycartBody extends StatelessWidget {
  const MycartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Expanded(child: Center(child: Image.asset("assets/img.png"))),
          const SizedBox(
            height: 25,
          ),
          const Row(
            children: [
              Text(
                "Order Subtotal",
                style: Styles.style18,
              ),
              Spacer(),
              Text(
                r"$42.97",
                style: Styles.style18,
              ),
            ],
          ),
          const SizedBox(
            height: 3,
          ),
          const Row(
            children: [
              Text(
                "Discount",
                style: Styles.style18,
              ),
              Spacer(),
              Text(
                r"$0",
                style: Styles.style18,
              ),
            ],
          ),
          const SizedBox(
            height: 3,
          ),
          const Row(
            children: [
              Text(
                "Shipping",
                style: Styles.style18,
              ),
              Spacer(),
              Text(
                r"$8",
                style: Styles.style18,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 1,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            children: [
              Text(
                "Total",
                style: Styles.style24,
              ),
              Spacer(),
              Text(
                r"$50.97",
                style: Styles.style24,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            text: "Complete Payment",
            ontab: () {
              showModalBottomSheet(shape: const RoundedRectangleBorder(),
                context: context, builder: (context) {
                return const PaymentBottomSheet();
              }, );
           
            },
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
