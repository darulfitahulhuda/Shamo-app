part of 'home.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    User user = authProvider.user;

    PreferredSizeWidget header() {
      return AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor1,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(defaultMargin),
            child: Row(
              children: [
                ClipOval(
                  child: Image.network(
                    user.profilePhotoUrl!,
                    width: 64,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, ${user.name}',
                        style: primaryTextStyle.copyWith(
                            fontSize: 24, fontWeight: semiBold),
                      ),
                      Text(
                        '@${user.username}',
                        style: secondaryTextStyle.copyWith(
                            fontSize: 16, fontWeight: regular),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/home', (route) => false);
                  },
                  child: Image.asset(
                    'assets/button_exit.png',
                    width: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            color: backgroundColor3,
            child: ListView(
              children: [
                account(context),
                SizedBox(height: 10),
                general(),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget account(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Account',
          style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
        ),
        SizedBox(height: 16),
        menuItem(
            name: 'EditProfile',
            onTap: () {
              Navigator.pushNamed(context, '/detail-profile');
            }),
        menuItem(name: 'Your Orders'),
        menuItem(name: 'Help'),
      ],
    );
  }

  Widget general() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'General',
          style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
        ),
        SizedBox(height: 16),
        menuItem(name: 'Privacy & Policy'),
        menuItem(name: 'Term of Service'),
        menuItem(name: 'Rate App'),
      ],
    );
  }

  Widget menuItem({required String name, VoidCallback? onTap}) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style:
                secondaryTextStyle.copyWith(fontSize: 13, fontWeight: regular),
          ),
          GestureDetector(
            onTap: onTap,
            child: Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: secondaryTextColor,
            ),
          )
        ],
      ),
    );
  }
}
