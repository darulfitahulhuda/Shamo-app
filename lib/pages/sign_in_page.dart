part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: defaultMargin, vertical: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              TextFieldCustom(
                controller: emailController,
                name: 'Email Address',
                image: 'assets/icon_email.png',
                subtitle: 'Your Address',
              ),
              TextFieldCustom(
                controller: passwordController,
                name: 'Password',
                subtitle: 'Your Password',
                image: 'assets/icon_password.png',
                obsecureText: true,
                marginBottom: 30,
              ),
              isLoading ? LoadingButton() : signIn(),
              Spacer(),
              footer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Login',
          style: primaryTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
        Text(
          'Sign In to Continue',
          style: subtitleTextStyle.copyWith(fontSize: 14, fontWeight: regular),
        ),
        SizedBox(height: 70),
      ],
    );
  }

  Widget signIn() {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return ElevatedButton(
      onPressed: () async {
        setState(() {
          isLoading = true;
        });
        if (await authProvider.login(
            email: emailController.text, password: passwordController.text)) {
          Navigator.pushNamed(context, '/home');
        } else {
          var snackBar = SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text(
              'Gagal Login',
              textAlign: TextAlign.center,
              style: primaryTextStyle,
            ),
            backgroundColor: alertColor,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }

        setState(() {
          isLoading = false;
        });
      },
      style: ElevatedButton.styleFrom(
          primary: primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      child: Center(
        child: Container(
          height: 50,
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(
            'Sign In',
            style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
        ),
      ),
    );
  }

  Widget footer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: secondaryTextStyle,
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/sign-up');
          },
          child: Text(
            'Sign Up',
            style: priceTextStyle.copyWith(fontWeight: medium),
          ),
        )
      ],
    );
  }
}
