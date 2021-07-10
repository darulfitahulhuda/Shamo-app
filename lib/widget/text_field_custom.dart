part of 'widgets.dart';

class TextFieldCustom extends StatelessWidget {
  final String name;
  final String? image;
  final String subtitle;
  final bool obsecureText;
  final double marginBottom;
  final TextEditingController controller;

  TextFieldCustom(
      {required this.name,
      this.image,
      required this.subtitle,
      this.obsecureText = false,
      this.marginBottom = 20.0,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: primaryTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
        Container(
          height: 50,
          width: double.infinity,
          margin: EdgeInsets.only(top: 12, bottom: marginBottom),
          padding: EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: backgroundColor2),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  image!,
                  width: 18,
                  height: 19,
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    obscureText: obsecureText,
                    style: primaryTextStyle,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: subtitle,
                        hintStyle: subtitleTextStyle),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
