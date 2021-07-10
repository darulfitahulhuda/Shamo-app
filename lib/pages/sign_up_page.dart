part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  // const SignUpPage({ Key? key }) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController usernameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handelSignUp() async {
      setState(() {
        isLoading = true;
      });
      if (await authProvider.register(
          name: nameController.text,
          username: usernameController.text,
          email: emailController.text,
          password: passwordController.text)) {
        Navigator.pushNamed(context, '/home');
      } else {
        var snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Gagal Register',
            textAlign: TextAlign.center,
            style: primaryTextStyle,
          ),
          backgroundColor: Colors.redAccent,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }

      setState(() {
        isLoading = false;
      });

      print(authProvider);
    }

    Widget header() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sign Up',
            style: primaryTextStyle.copyWith(
              fontSize: 24,
              fontWeight: semiBold,
            ),
          ),
          Text(
            'Register and Happy Shopping',
            style:
                subtitleTextStyle.copyWith(fontSize: 14, fontWeight: regular),
          ),
          SizedBox(height: 70),
        ],
      );
    }

    Widget signUp() {
      return ElevatedButton(
        onPressed: handelSignUp,
        style: ElevatedButton.styleFrom(
            primary: primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        child: Center(
          child: Container(
            height: 50,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              'Sign Up',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
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
            "Already have an account?",
            style: secondaryTextStyle,
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, 'sign-in');
            },
            child: Text(
              'Sign In',
              style: priceTextStyle.copyWith(fontWeight: medium),
            ),
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: defaultMargin, vertical: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              TextFieldCustom(
                controller: nameController,
                name: 'Full Name',
                subtitle: 'Your Full Name',
                image: 'assets/icon_name.png',
              ),
              TextFieldCustom(
                controller: usernameController,
                name: 'Username',
                subtitle: 'Your Username',
                image: 'assets/icon_username.png',
              ),
              TextFieldCustom(
                controller: emailController,
                name: 'Email Address',
                subtitle: 'Your Email Address',
                image: 'assets/icon_email.png',
              ),
              TextFieldCustom(
                controller: passwordController,
                obsecureText: true,
                name: 'Password',
                subtitle: 'Your Password',
                image: 'assets/icon_password.png',
                marginBottom: 30,
              ),
              isLoading ? LoadingButton() : signUp(),
              Spacer(),
              footer(),
            ],
          ),
        ),
      ),
    );
  }
}
