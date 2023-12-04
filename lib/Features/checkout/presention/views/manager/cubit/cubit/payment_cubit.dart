import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/Features/checkout/data/models/payment_model/payment_input_model.dart';
import 'package:payment_app/Features/checkout/data/repos/checkout_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkoutRepo) : super(PaymentInitial());
  final CheckoutRepo checkoutRepo;
  Future makePayment({required PaymentInputModel paymentInputModel}) async {
    var data =
        await checkoutRepo.makePayment(paymentInputModel: paymentInputModel);

    data.fold((l) => emit(PaymentFailure(errMessage: l.errMessage)),
        (r) => emit(PaymentSuccess()));
  }

  @override
  void onChange(Change<PaymentState> change) {
    print(change.toString());
    super.onChange(change);
  }
}
