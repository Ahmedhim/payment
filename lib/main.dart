import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app/Core/api_keys.dart';
import 'package:payment_app/Features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:payment_app/Features/checkout/presention/views/manager/cubit/cubit/payment_cubit.dart';
import 'package:payment_app/Features/checkout/presention/views/mycart_views.dart';

void main() {
  Stripe.publishableKey = Apikeys.PublisherKey;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(PaymentApp());
}

class PaymentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(CheckoutRepoImp()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MycartView(),
      ),
    );
  }
}
