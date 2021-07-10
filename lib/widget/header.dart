part of 'widgets.dart';

class Header extends StatelessWidget {
  final String title;
  final bool leading;
  const Header({Key? key, required this.title, this.leading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor1,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: leading == true
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 14,
              ),
            )
          : null,
      elevation: 0,
      title: Text(
        title,
        style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
      ),
    );
  }
}
