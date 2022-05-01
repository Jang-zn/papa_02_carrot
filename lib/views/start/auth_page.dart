import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

import '../../constant/auth_page_status.dart';
import '../../constant/common_constant.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final inputBorder =
      const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey));

  final TextEditingController phoneController = TextEditingController(text:"010");

  final TextEditingController codeController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  VerificationStatus _verificationStatus=VerificationStatus.none;

  double getVerificationStatus(VerificationStatus status){
    switch(status){
      case VerificationStatus.none:
        return 0;
      case VerificationStatus.codeSent:
      case VerificationStatus.verifying:
      case VerificationStatus.done:
        return 100;
    }
  }


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Size size = MediaQuery.of(context).size;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text("전화번호 로그인"),
            leading: const Icon(Icons.phone, color: Colors.black87),
            backgroundColor: Colors.white,
          ),
          body: Form(
            key:formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(commonPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        ExtendedImage.asset(
                          'assets/imgs/lock.png',
                          width: size.width * 0.15,
                        ),
                        Text('''당근마켓은 휴대폰 번호로 가입해요.
번호는 안전하게 보관되며 
어디에도 공개되지 않아요''', style: Theme.of(context).textTheme.subtitle1),
                      ],
                    ),
                    const SizedBox(
                      height: commonPadding,
                    ),
                    TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(border: inputBorder),
                      inputFormatters: [MaskedInputFormatter("000-0000-0000")],
                      keyboardType: TextInputType.phone,
                      validator:(phone){
                        if(phone!=null && phone.length==13){
                          return null;
                        }else{
                          return "전화번호를 확인해주세요";
                        }
                      }
                    ),
                    const SizedBox(height:10),
                    TextButton(
                      child:const Text("인증문자 받기"),
                      onPressed: (){
                        if(formKey.currentState!=null){
                          bool passed = formKey.currentState!.validate();
                          if(passed) {
                            setState(){
                              _verificationStatus=VerificationStatus.codeSent;
                            }
                          }
                        }
                      },
                    ),
                    const SizedBox(height:commonPadding),
                    AnimatedContainer(
                      duration: const Duration(seconds:1),
                      height:getVerificationStatus(_verificationStatus),
                      child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            validator: (value){
                              if(value!=null && value.length!=6){
                                return "인증번호를 확인해주세요";
                              }else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(border: inputBorder),
                            keyboardType: TextInputType.number,
                            controller:codeController,
                            inputFormatters: [MaskedInputFormatter("000000")],
                          ),
                          const SizedBox(height:10),
                          TextButton(
                            child:const Text("인증번호 확인"),
                            onPressed: (){},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}



