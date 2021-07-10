part of 'widgets.dart';

class CustomPage extends StatelessWidget {
  final String appBarText;
  final String image;
  final String title;
  final String subtitle;
  final String buttonTitle1;
  final String? buttonTitle2;
  final VoidCallback buttonTap1;
  final VoidCallback? buttonTap2;

  const CustomPage(
      {required this.appBarText,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.buttonTitle1,
      this.buttonTitle2,
      required this.buttonTap1,
      this.buttonTap2});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          AppBar(
            backgroundColor: backgroundColor1,
            centerTitle: true,
            automaticallyImplyLeading: false,
            elevation: 0,
            title: Text(
              appBarText,
              style:
                  primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
            ),
          ),
          Expanded(
            child: Container(
              color: backgroundColor3,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    image,
                    width: 80,
                    height: 80,
                  ),
                  SizedBox(height: 20),
                  Text(
                    title,
                    style: primaryTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                  ),
                  SizedBox(height: 12),
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: secondaryTextStyle.copyWith(
                        fontSize: 14, fontWeight: regular),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          )),
                      onPressed: buttonTap1,
                      child: Container(
                        alignment: Alignment.center,
                        width: 200,
                        height: 44,
                        child: Text(
                          buttonTitle1,
                          style: primaryTextStyle.copyWith(
                              fontSize: 16, fontWeight: medium),
                        ),
                      )),
                  SizedBox(height: 12),
                  (buttonTap2 == null)
                      ? SizedBox()
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: backgroundColor5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              )),
                          onPressed: buttonTap2,
                          child: Container(
                            alignment: Alignment.center,
                            width: 200,
                            height: 44,
                            child: Text(
                              buttonTitle2!,
                              style: whiteTextStyle.copyWith(
                                  fontSize: 16, fontWeight: medium),
                            ),
                          )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
