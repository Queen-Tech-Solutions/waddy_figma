import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:waddy_figma_login_screen/widgets/common_asset_svg_image_widget.dart';
import 'package:waddy_figma_login_screen/widgets/common_global_button.dart';
import 'package:waddy_figma_login_screen/widgets/common_text_button.dart';
import 'package:waddy_figma_login_screen/widgets/common_text_form_field_widget.dart';
import 'package:waddy_figma_login_screen/widgets/common_title_text.dart';

import 'Constants/app_constants.dart';
import 'Helpers/shared.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ///controller for phone text field
  late TextEditingController phoneController;

  ///controller for password text field
  late TextEditingController passwordController;

  ///global key for from
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.lightMainBGColor,
      resizeToAvoidBottomInset: false,
      body: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ///spacer
            getSpaceHeight(AppConstants.selectFiltersAlertPadding + 56),

            ///app logo
            const CommonAssetSvgImageWidget(
              imageString: 'logo.svg',
              width: 148,
              height: 189,
            ),

            ///spacer
            getSpaceHeight(AppConstants.drawerVerticalContentPadding + 20),

            ///login form
            Container(
              width: double.infinity,
              height: getWidgetHeight(555),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppConstants.buttonYellowColor.withOpacity(0.24),
                      offset: const Offset(0, -2),
                      blurRadius: 10,
                    )
                  ],
                  color: AppConstants.mainBGColor,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(
                          AppConstants.drawerHorizontalContentPadding),
                      topLeft: Radius.circular(
                          AppConstants.drawerHorizontalContentPadding))),
              child: Padding(
                padding: EdgeInsets.only(
                  left: getWidgetWidth(AppConstants.defaultPadding),
                  right: getWidgetWidth(AppConstants.defaultPadding),
                ),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///spacer
                          getSpaceHeight(AppConstants.defaultPadding),

                          ///form header
                          const Center(
                            child: CommonTitleText(
                              textKey: "تسجيل الدخول",
                              textFontWeight: FontWeight.w700,
                              textColor: AppConstants.whiteColor,
                              textFontSize: AppConstants.largeFontSize,
                            ),
                          ),

                          ///spacer
                          getSpaceHeight(AppConstants.defaultPadding),

                          ///phone title
                          const CommonTitleText(
                            textKey: "رقم الهاتف",
                            textFontWeight: FontWeight.w600,
                            textAlignment: TextAlign.start,
                            textColor: AppConstants.whiteColor,
                            textFontSize: AppConstants.largeFontSize,
                          ),

                          ///spacer
                          getSpaceHeight(AppConstants.drawerTilePadding),

                          ///phone text field
                          CommonTextFormField(
                            controller: phoneController,
                            withPrefixIcon: true,
                            prefixIcon: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 14),
                              child: CommonAssetSvgImageWidget(
                                imageString: 'phone_icon.svg',
                                height: 16,
                                width: 16,
                              ),
                            ),
                            onChanged: (str) {
                              return null;
                            },
                            hintKey: "ادخل رقم الهاتف",
                            keyboardType: TextInputType.number,
                            inputFormatter: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            validator: (phone) {
                              if (phone!.isEmpty) {
                                return "رقم الهاتف قصير جدا";
                              } else if (phone.length !=
                                  AppConstants.phoneLength) {
                                return "رقم الهاتف يجب ان يكون 11 رقم";
                              } else {
                                return null;
                              }
                            },
                          ),

                          ///spacer
                          getSpaceHeight(AppConstants.defaultPadding),

                          ///password title
                          const CommonTitleText(
                            textKey: "كلمة المرور",
                            textFontWeight: FontWeight.w600,
                            textAlignment: TextAlign.start,
                            textColor: AppConstants.whiteColor,
                            textFontSize: AppConstants.largeFontSize,
                          ),

                          ///spacer
                          getSpaceHeight(AppConstants.drawerTilePadding),

                          ///password text field
                          CommonTextFormField(
                            controller: passwordController,
                            withPrefixIcon: true,
                            prefixIcon: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 14),
                              child: CommonAssetSvgImageWidget(
                                imageString: 'lock_icon.svg',
                                height: 16,
                                width: 16,
                              ),
                            ),
                            onChanged: (str) {
                              return null;
                            },
                            hintKey: "ادخل كلمة المرور",
                            withSuffixIcon: true,
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.visibility,
                                color: AppConstants.buttonYellowColor,
                              ),
                            ),
                            keyboardType: TextInputType.text,
                            validator: (password) {
                              if (password!.isEmpty) {
                                return "كلمة السر لا يجب ان تكون فارغة";
                              } else if (password.length < 8) {
                                return "كلمة السر يجب ان تكون اكثر من 6 احرف";
                              } else {
                                return null;
                              }
                            },
                            maxLines: 1,
                            action: TextInputAction.done,
                            isObscureText: false,
                          ),

                          ///spacer
                          getSpaceHeight(AppConstants.drawerTilePadding),

                          ///forget password button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CommonTextButton(
                                textAlign: TextAlign.end,
                                height: getWidgetHeight(
                                    AppConstants.defaultPadding),
                                onTap: () {},
                                textKey: "نسيت كلمة السر؟",
                                textColor: AppConstants.buttonYellowColor,
                              ),
                            ],
                          ),

                          ///spacer
                          getSpaceHeight(
                              AppConstants.drawerHorizontalContentPadding),

                          ///submit button
                          CommonGlobalButton(
                            isLoading: false,
                            buttonText: "برجاء تحديد نوع الحساب",
                            onPressedFunction: () {},
                            isEnable: true,
                            width: 500,
                            buttonBackgroundColor:
                                AppConstants.buttonYellowColor,
                            buttonTextColor: AppConstants.mainBGColor,
                            buttonTextFontWeight: FontWeight.w700,
                            buttonTextSize: AppConstants.largeFontSize,
                          ),

                          ///spacer
                          getSpaceHeight(AppConstants.mediumPadding),

                          ///or
                          const Center(
                              child: CommonTitleText(
                            textKey: "او",
                          )),

                          ///spacer
                          getSpaceHeight(AppConstants.mediumPadding),

                          ///signUp button
                          CommonGlobalButton(
                            buttonText: "انشاء حساب ",
                            onPressedFunction: () {},
                            width: 500,
                            buttonBackgroundColor: AppConstants.mainBGColor,
                            borderColor: AppConstants.buttonYellowColor,
                            showBorder: true,
                            buttonTextColor: AppConstants.buttonYellowColor,
                            buttonTextFontWeight: FontWeight.w700,
                            buttonTextSize: AppConstants.largeFontSize,
                          ),

                          ///spacer
                          getSpaceHeight(20)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
