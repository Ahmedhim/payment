import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/Core/widgets/Custom_button.dart';
import 'package:payment_app/Features/checkout/data/models/payment_model/payment_input_model.dart';
import 'package:payment_app/Features/checkout/presention/views/manager/cubit/cubit/payment_cubit.dart';
import 'package:payment_app/Features/checkout/presention/views/thank_you_view.dart';
import 'package:payment_app/Features/checkout/presention/views/widgets/payment_list_item.dart';

class PaymentBottomSheet extends StatelessWidget {
  const PaymentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ThankYouView()));
        }
        if (state is PaymentFailure) {
          log(state.errMessage);
        }
      },
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: SizedBox(height: 70, child: PaymentListItem()),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: CustomButton(
                text: "pay",
                ontab: () async {
                  PaymentInputModel paymentInputModel = PaymentInputModel(customerId: "cus_P8kK1EvMOSh3Wt",
                    amount: (100 * 100).toString(), currency: "USD",);
                   await BlocProvider.of<PaymentCubit>(context).makePayment(paymentInputModel: paymentInputModel,);
                },
              ),
            )
          ],
        );
      },
    );
  }
}
