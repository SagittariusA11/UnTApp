import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untvoice/profile/add_profile.dart';
import 'package:untvoice/views/otp.dart';
import 'package:untvoice/widgets/my_widgets.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  static String verify = "";

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController countrycode = TextEditingController();
  // TextEditingController phone = TextEditingController();
  var phone = "";

  @override
  void initState() {
    // TODO: implement initState
    countrycode.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/login/logo.png',
                width: 150,
                height: 150,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "You need to register your phone without getting started!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 40,
                      child: TextField(
                        controller: countrycode,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Text(
                      "|",
                      style: TextStyle(fontSize: 33, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextField(
                          onChanged: (value){
                            phone = value;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Phone",
                          ),
                        )
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: elevatedButton(
                  text: "Send the code",
                  onpress: () async {
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: '${countrycode.text + phone}',
                      verificationCompleted: (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {
                        LoginView.verify = verificationId;
                        Get.to(()=>otpVerify());
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                  },
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:untvoice/profile/add_profile.dart';
//
// import '../controller/auth_controller.dart';
// import '../utils/app_color.dart';
// import '../widgets/my_widgets.dart';
//
// class LoginView extends StatefulWidget {
//   const LoginView({Key? key}) : super(key: key);
//
//   @override
//   State<LoginView> createState() => _LoginViewState();
// }
//
// class _LoginViewState extends State<LoginView> {
//
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();
//   int selectedRadio = 0;
//   TextEditingController forgetEmailController = TextEditingController();
//
//   void setSelectedRadio(int val) {
//     setState(() {
//       selectedRadio = val;
//     });
//   }
//
//   bool isSignUp = false;
//
//   late AuthController authController;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     authController = Get.put(AuthController());
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       builder: (context, child) => SafeArea(
//         child: DefaultTabController(
//           length: 2,
//           child: Scaffold(
//             body: SingleChildScrollView(
//               child: Container(
//                 margin: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: Get.height * 0.08,
//                     ),
//                     isSignUp
//                         ? myText(
//                       text: 'Sign Up',
//                       style: TextStyle(
//                         fontSize: 23,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     )
//                         : myText(
//                       text: 'Login',
//                       style: GoogleFonts.poppins(
//                         fontSize: 23,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     SizedBox(
//                       height: Get.height * 0.03,
//                     ),
//                     isSignUp
//                         ? Container(
//                       child: Text(
//                         'Welcome, Please Sign up to see events and classes from your friends.',
//                         style: GoogleFonts.roboto(
//                           letterSpacing: 0,
//                           fontSize: 18,
//                           fontWeight: FontWeight.w400,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     )
//                         : Container(
//                       child: Text(
//                         'Welcome back, Please Sign in and continue your journey with us.',
//                         style: GoogleFonts.roboto(
//                           letterSpacing: 0,
//                           fontSize: 18,
//                           fontWeight: FontWeight.w400,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                     SizedBox(
//                       height: Get.height * 0.03,
//                     ),
//                     Container(
//                       width: Get.width * 0.55,
//                       child: TabBar(
//                         labelPadding: EdgeInsets.all(Get.height * 0.01),
//                         unselectedLabelColor: Colors.grey,
//                         labelColor: Colors.black,
//                         indicatorColor: Colors.black,
//                         onTap: (v) {
//                           setState(() {
//                             isSignUp = !isSignUp;
//                           });
//                         },
//                         tabs: [
//                           myText(
//                             text: 'Login',
//                             style: TextStyle(
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.w500,
//                                 color: AppColors.black),
//                           ),
//                           myText(
//                             text: 'Sign Up',
//                             style: TextStyle(
//                               fontSize: 22,
//                               fontWeight: FontWeight.w500,
//                               color: AppColors.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: Get.height * 0.04,
//                     ),
//                     Container(
//                       width: Get.width,
//                       height: Get.height * 0.6,
//                       child: Form(
//                         key: formKey,
//                         child: TabBarView(
//                           physics: NeverScrollableScrollPhysics(),
//                           children: [
//                             LoginWidget(),
//                             SignUpWidget(),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//       designSize: const Size(375.0, 728.0),
//     );
//   }
//
//
//   Widget LoginWidget(){
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               myTextFieldEmail(
//                   bool: false,
//                   prefixicon: 'assets/login/mail.png',
//                   text: 'sarasmith12@gmail.com',
//                   validator: (String input){
//                     if(input.isEmpty){
//                       Get.snackbar('Warning', 'Email is required.',colorText: Colors.white,backgroundColor: Colors.blue);
//                       return '';
//                     }
//
//                     if(!input.contains('@')){
//                       Get.snackbar('Warning', 'Email is invalid.',colorText: Colors.white,backgroundColor: Colors.blue);
//                       return '';
//                     }
//                   },
//                   controller: emailController
//               ),
//               SizedBox(
//                 height: Get.height * 0.02,
//               ),
//               myTextFieldPassword(
//                   bool: true,
//                   prefixicon: 'assets/login/lock.png',
//                   suffixicon: 'assets/login/eye.png',
//                   text: 'password',
//                   validator: (String input){
//                     if(input.isEmpty){
//                       Get.snackbar('Warning', 'Password is required.',colorText: Colors.white,backgroundColor: Colors.blue);
//                       return '';
//                     }
//
//                     if(input.length <6){
//                       Get.snackbar('Warning', 'Password should be 6+ characters.',colorText: Colors.white,backgroundColor: Colors.blue);
//                       return '';
//                     }
//                   },
//                   controller: passwordController
//               ),
//               InkWell(
//                 onTap: () {
//                   Get.defaultDialog(
//                       title: 'Forget Password?',
//                       content: Container(
//                         width: Get.width,
//                         child: Column(
//                           children: [
//                             myTextFieldEmail(
//                                 bool: false,
//                                 prefixicon: 'assets/login/lock.png',
//                                 text: 'enter your email...',
//                                 controller: forgetEmailController
//                             ),
//
//                             SizedBox(
//                               height: 10,
//                             ),
//
//                             MaterialButton(
//                               color: Colors.blue,
//                               onPressed: (){
//                                 authController.forgetPassword(forgetEmailController.text.trim());
//                               },child: Text("Sent"),minWidth: double.infinity,)
//
//                           ],
//                         ),
//                       )
//                   );
//                 },
//                 child: Container(
//                   margin: EdgeInsets.only(
//                     top: Get.height * 0.02,
//                   ),
//                   child: myText(
//                       text: 'Forgot password?',
//                       style: TextStyle(
//                         fontSize: 19,
//                         fontWeight: FontWeight.w400,
//                         color: AppColors.black,
//                       )),
//                 ),
//               ),
//             ],
//           ),
//           Obx(()=> authController.isLoading.value? Center(child: CircularProgressIndicator(),) :Container(
//             height: 50,
//             margin: EdgeInsets.symmetric(
//                 vertical: Get.height * 0.04),
//             width: Get.width,
//             child: elevatedButton(
//               text: 'Login',
//               onpress: () {
//
//                 if(!formKey.currentState!.validate()){
//                   return;
//                 }
//
//                 authController.login(email: emailController.text.trim(),password: passwordController.text.trim());
//
//               },
//             ),
//           )),
//           SizedBox(
//             height: Get.height * 0.02,
//           ),
//           myText(
//             text: 'Or Connect With',
//             style: TextStyle(
//               fontSize: 19,
//               fontWeight: FontWeight.w400,
//               color: AppColors.black,
//             ),
//           ),
//           SizedBox(
//             height: Get.height * 0.01,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               socialAppsIcons(
//                   text: 'assets/login/google.png',
//                   onPressed: (){
//
//                     // authController.signInWithGoogle();
//
//                   }
//
//               ),
//             ],
//           ),
//           SizedBox(
//             height: Get.height * 0.02,
//           ),
//           Container(
//               width: Get.width * 0.8,
//               child: RichText(
//                 textAlign: TextAlign.center,
//                 text: TextSpan(children: [
//                   TextSpan(
//                       text:
//                       'By signing up, you agree our ',
//                       style: TextStyle(
//                           color: Color(0xff262628),
//                           fontSize: 12)),
//                   TextSpan(
//                       text:
//                       'terms, Data policy and cookies policy',
//                       style: TextStyle(
//                           color: Color(0xff262628),
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold)),
//                 ]),
//               )),
//         ],
//       ),
//     );
//   }
//
//   Widget SignUpWidget(){
//     return SingleChildScrollView(
//         child: Column(
//           children: [
//
//
//             myTextFieldEmail(
//                 bool: false,
//                 prefixicon: 'assets/login/mail.png',
//                 text: 'Email',
//                 validator: (String input){
//                   if(input.isEmpty){
//                     Get.snackbar('Warning', 'Email is required.',colorText: Colors.white,backgroundColor: Colors.blue);
//                     return '';
//                   }
//
//                   if(!input.contains('@')){
//                     Get.snackbar('Warning', 'Email is invalid.',colorText: Colors.white,backgroundColor: Colors.blue);
//                     return '';
//                   }
//                 },
//                 controller: emailController
//             ),
//             SizedBox(
//               height: Get.height * 0.02,
//             ),
//             myTextFieldPassword(
//                 bool: true,
//                 prefixicon: 'assets/login/lock.png',
//                 suffixicon: 'assets/login/eye.png',
//                 text: 'password',
//                 validator: (String input){
//                   if(input.isEmpty){
//                     Get.snackbar('Warning', 'Password is required.',colorText: Colors.white,backgroundColor: Colors.blue);
//                     return '';
//                   }
//
//                   if(input.length <6){
//                     Get.snackbar('Warning', 'Password should be 6+ characters.',colorText: Colors.white,backgroundColor: Colors.blue);
//                     return '';
//                   }
//                 },
//                 controller: passwordController
//             ),
//             SizedBox(
//               height: Get.height * 0.02,
//             ),
//             myTextFieldPassword(
//                 bool: true,
//                 prefixicon: 'assets/login/lock.png',
//                 suffixicon: 'assets/login/eye.png',
//                 text: 'Re-enter password',
//                 validator: (input){
//                   if(input != passwordController.text.trim()){
//                     Get.snackbar('Warning', 'Confirm Password is not same as password.',colorText: Colors.white,backgroundColor: Colors.blue);
//                     return '';
//                   }
//                 },
//                 controller: confirmPasswordController
//             ),
//             Obx(()=> authController.isLoading.value? Center(child: CircularProgressIndicator(),) : Container(
//               height: 50,
//               margin: EdgeInsets.symmetric(
//                 vertical: Get.height * 0.04,
//               ),
//               width: Get.width,
//               child: elevatedButton(
//                 text: 'Sign Up',
//                 onpress: () {
//                   if(!formKey.currentState!.validate()){
//                     return;
//                   }
//
//                   authController.signUp(email: emailController.text.trim(),password: passwordController.text.trim());
//
//                 },
//               ),
//             )),
//             myText(
//               text: 'Or Connect With',
//               style: TextStyle(
//                 fontSize: Get.height * 0.025,
//               ),
//             ),
//             SizedBox(
//               height: Get.height * 0.01,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 socialAppsIcons(
//                     text: 'assets/login/google.png',
//                     onPressed: (){
//                     }
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: Get.height * 0.02,
//             ),
//             Container(
//                 width: Get.width * 0.8,
//                 child: RichText(
//                   textAlign: TextAlign.center,
//                   text: TextSpan(children: [
//                     TextSpan(
//                         text:
//                         'By signing up, you agree our ',
//                         style: TextStyle(
//                             color: Color(0xff262628),
//                             fontSize: 12)),
//                     TextSpan(
//                         text:
//                         'terms, Data policy and cookies policy',
//                         style: TextStyle(
//                             color: Color(0xff262628),
//                             fontSize: 12,
//                             fontWeight: FontWeight.bold)),
//                   ]),
//                 )),
//           ],
//         )
//     );
//   }
// }
