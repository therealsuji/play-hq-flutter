import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/models/common_models/user/user_details.dart';
import 'package:play_hq/view_models/profile/settings/settings_view_model.dart';
import 'package:play_hq/widgets/custom_button_widget.dart';
import 'package:play_hq/widgets/custom_smaller_button_widget.dart';
import 'package:play_hq/widgets/custom_text_widget.dart';
import 'package:play_hq/widgets/custom_textfield_widget.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  final UserDetails userDetails;

  const SettingsScreen({
    required this.userDetails,
    Key? key,
  }) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late String _name, _displayName, _phoneNumber;

  @override
  void initState() {
    super.initState();
    _name = "${widget.userDetails.name}";
    _displayName = "${widget.userDetails.displayName}";
    _phoneNumber = "${widget.userDetails.phone}";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: BACKGROUND_COLOR,
        body: SafeArea(
          child: Consumer<SettingsViewModel>(
            builder: (_, val, __) {
              return Container(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: 24,
                          right: 24,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: Icon(
                                Icons.arrow_back_ios_rounded,
                                color: Colors.white,
                              ),
                              onTap: (() => Navigator.pop(context)),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 15, top: 5),
                              child: CustomTextWidget(
                                'Settings',
                                isDynamic: false,
                                width: ScreenUtils.getDesignWidth(75),
                                style: Theme.of(context).primaryTextTheme.headline2,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: ScreenUtils.getDesignHeight(40),
                        ),
                        height: ScreenUtils.getDesignHeight(90),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQEZrATmgHOi5ls0YCCQBTkocia_atSw0X-Q&usqp=CAU',
                            ),
                          ),
                        ),
                      ),
                      _profileDetails(
                        title: 'Your Name',
                        labelText: widget.userDetails.name ?? "Your Name",
                        iconData: Icons.account_circle_outlined,
                        width: 67,
                        onChanged: (name) {},
                      ),
                      _profileDetails(
                        title: 'Display Name',
                        labelText: widget.userDetails.displayName ?? 'Display Name',
                        iconData: Icons.account_circle_sharp,
                        width: 85,
                        onChanged: (displayName) {},
                      ),
                      _profileDetails(
                        title: 'Mobile Number',
                        labelText: widget.userDetails.phone ?? '0774147787',
                        iconData: Icons.call_outlined,
                        width: 95,
                        onChanged: (phoneNumber) {},
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 24,
                          right: 24,
                          top: 30,
                        ),
                        child: Row(
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: PRIMARY_GRADIENT,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Container(
                                width: ScreenUtils.getDesignWidth(156.0),
                                height: 55.0,
                                margin: EdgeInsets.all(1.0),
                                decoration: BoxDecoration(),
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: BACKGROUND_COLOR,
                                    foregroundColor: Colors.white,
                                  ),
                                  child: Text(
                                    "Change Preferences",
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .button!
                                        .copyWith(fontSize: 14.0),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                            Spacer(),
                            CustomButton(
                              buttonText: 'Save Changes',
                              gradient: PRIMARY_GRADIENT,
                              width: ScreenUtils.getDesignWidth(156.0),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 24,
                          right: 24,
                          top: 30,
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              child: CustomTextWidget(
                                'No Address',
                                isDynamic: false,
                                width: ScreenUtils.getDesignWidth(72),
                                style: Theme.of(context).primaryTextTheme.headline3,
                              ),
                            ),
                            Spacer(),
                            Container(
                              child: CustomSmallerButton(
                                buttonText: 'Add Address',
                                gradient: PRIMARY_GRADIENT,
                                textFontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 24,
                          right: 24,
                          top: 30,
                        ),
                        width: double.infinity,
                        height: ScreenUtils.getDesignHeight(1.5),
                        decoration: BoxDecoration(
                          gradient: PRIMARY_GRADIENT,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      _otherSettings(
                        'Privacy',
                        _settingsDetailsWidget('Hide my Profile', true, true, ''),
                        48,
                      ),
                      _otherSettings(
                        'Support',
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _settingsDetailsWidget('Rate Us', false, true, ''),
                            _settingsDetailsWidget('Contact Us', false, true, ''),
                          ],
                        ),
                        48,
                      ),
                      _otherSettings(
                        'Social Network',
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _settingsDetailsWidget(
                                'Facebook', false, false, 'assets/icons/facebook.svg'),
                            _settingsDetailsWidget(
                                'Instagram', false, false, 'assets/icons/instagram.svg'),
                          ],
                        ),
                        95,
                      ),
                      _otherSettings(
                        'Legal',
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _settingsDetailsWidget('Terms of Use', false, true, ''),
                            _settingsDetailsWidget('Privacy Policy', false, true, ''),
                            _settingsDetailsWidget('Subscription Terms', false, true, ''),
                          ],
                        ),
                        35,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 24,
                          right: 24,
                          top: 30,
                        ),
                        child: GestureDetector(
                          child: CustomButton(
                            buttonText: 'SIGN OUT',
                            isSignOut: true,
                            buttonColor: MAIN_CONTAINER_COLOR.withOpacity(0.6),
                            onPressed: () => val.logoutUser(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _profileDetails({
    required String title,
    required String labelText,
    required IconData iconData,
    required double width,
    required Function(String) onChanged,
  }) {
    return Container(
      margin: EdgeInsets.only(
        top: 30,
        left: 24,
        right: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextWidget(
            title,
            isDynamic: false,
            width: ScreenUtils.getDesignWidth(width),
            style: Theme.of(context).primaryTextTheme.headline3,
          ),
          CustomTextfieldWidget(
            labelText: labelText,
            iconData: iconData,
            hideText: false,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _otherSettings(String title, Widget child, double width) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              left: 24,
              top: ScreenUtils.getDesignHeight(30),
            ),
            child: CustomTextWidget(
              title,
              isDynamic: false,
              width: ScreenUtils.getDesignWidth(width),
              style: Theme.of(context).primaryTextTheme.headline3?.copyWith(
                    color: SUB_TEXT_COLOR,
                  ),
            ),
          ),
          child,
        ],
      ),
    );
  }

  Widget _settingsDetailsWidget(
    String title,
    bool isSwitch,
    bool onlyText,
    String? svgPath,
  ) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      height: ScreenUtils.getDesignHeight(55),
      color: MAIN_CONTAINER_COLOR.withOpacity(0.6),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Row(
            children: [
              onlyText
                  ? Container(
                      margin: EdgeInsets.only(right: 10),
                      child: CustomTextWidget(
                        title,
                        isDynamic: false,
                        style: Theme.of(context).primaryTextTheme.headline6,
                      ),
                    )
                  : Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          child: SvgPicture.asset(svgPath ?? ""),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: CustomTextWidget(
                            title,
                            isDynamic: false,
                            style: Theme.of(context).primaryTextTheme.headline6,
                          ),
                        ),
                      ],
                    ),
              Spacer(),
              isSwitch
                  ? Switch.adaptive(
                      activeColor: PRIMARY_COLOR,
                      value: true,
                      onChanged: (value) {},
                    )
                  : Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: PRIMARY_GRADIENT,
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 10,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
