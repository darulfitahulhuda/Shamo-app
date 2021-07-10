part of 'pages.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor3,
      body: SingleChildScrollView(child: body()),
    );
  }

  PreferredSizeWidget header() {
    return AppBar(
      centerTitle: true,
      backgroundColor: backgroundColor1,
      leading: IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        'Edit Profile',
        style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.check),
        )
      ],
    );
  }

  Widget body() {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    User user = authProvider.user;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: defaultMargin, vertical: defaultMargin),
      width: double.infinity,
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(user.profilePhotoUrl!))),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: defaultMargin),
            width: double.infinity,
            child: Column(
              children: [
                textInput(menu: 'Name', hintText: '${user.name}'),
                textInput(menu: 'Username', hintText: '@${user.username}'),
                textInput(menu: 'Email Address', hintText: '${user.email}'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget textInput({String? menu, String? hintText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          menu!,
          style: secondaryTextStyle.copyWith(fontSize: 13, fontWeight: regular),
        ),
        TextFormField(
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: primaryTextStyle,
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: subtitleTextColor))),
        ),
        SizedBox(height: 24),
      ],
    );
  }
}
