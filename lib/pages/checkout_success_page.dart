part of 'pages.dart';

class CheckoutSuccessPage extends StatelessWidget {
  const CheckoutSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPage(
        appBarText: 'Checkout Sucess',
        title: 'You made a Transaction',
        subtitle: 'Stay at home while we\nprepare your dream shoes',
        buttonTap1: () {
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        },
        buttonTitle1: 'Order Other Shoes',
        image: 'assets/icon_empty_cart.png',
        buttonTap2: () {},
        buttonTitle2: 'View My Order',
      ),
    );
  }
}
