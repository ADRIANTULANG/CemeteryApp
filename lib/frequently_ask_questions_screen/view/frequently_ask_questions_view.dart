import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../customer_registration_screen/view/customer_registration_view.dart';

class FrequestAskQuestionsView extends StatelessWidget {
  const FrequestAskQuestionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 247, 236, 144),
        title: Text("FAQ's"),
        centerTitle: true,
      ),
      body: Container(
        width: 100.w,
        padding: EdgeInsets.only(left: 5.w, right: 5.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 3.h,
              ),
              Text(
                "Now that I'm new to this platform, what should I do?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Step 1:",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                "Make sure that you have the following documents",
                textAlign: TextAlign.left,
                style:
                    TextStyle(fontSize: 15.sp, fontWeight: FontWeight.normal),
              ),
              Text(
                "- Death Certificate \n- Burial Permit \n- Valid Identification\n- Certificate of Ownership",
                textAlign: TextAlign.left,
                style:
                    TextStyle(fontSize: 15.sp, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Step 2:",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                "Simply click the link below to create an account if you don't already have one",
                textAlign: TextAlign.left,
                style:
                    TextStyle(fontSize: 15.sp, fontWeight: FontWeight.normal),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => CustomerRegistrationView());
                },
                child: Text(
                  "Click here",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 15.sp,
                      color: Colors.lightBlueAccent,
                      fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Step 3:",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                "Simply fill out the following information to create an account.",
                textAlign: TextAlign.left,
                style:
                    TextStyle(fontSize: 15.sp, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Step 4:",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                "Simply log into your account after that.",
                textAlign: TextAlign.left,
                style:
                    TextStyle(fontSize: 15.sp, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 4.h,
              ),
              Container(
                width: 100.w,
                alignment: Alignment.centerLeft,
                child: Text(
                  "How can I transport the remains?",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                "Cremated remains may be mailed or carried by hand to another destination. For mailing, they must be placed in an inner container within a padded outer container. If you are taking them on a plane you should leave them in the box just as it came from the crematory, with the official documents attached. Security requires that they be x-rayed, so they must be in a non-metal container.",
                textAlign: TextAlign.left,
                style:
                    TextStyle(fontSize: 15.sp, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 4.h,
              ),
              Container(
                width: 100.w,
                alignment: Alignment.centerLeft,
                child: Text(
                  "What can I do with remains?",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                " For help and deciding between the cremation and burial please talk to the manager and/or the funeral director to help secure the death certificate and the cremation permit.",
                textAlign: TextAlign.left,
                style:
                    TextStyle(fontSize: 15.sp, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 4.h,
              ),
              Container(
                width: 100.w,
                alignment: Alignment.centerLeft,
                child: Text(
                  "What do I do when death occurs?",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                "If death takes place at home, you should call your family doctor first to formally confirm the death or if the family did not have a family doctor you should have to call your local police department. A police officer will attend the scene and determine if the death appeared to be a natural cause. The officer will call the medical examiner to determine if there is a medical doctor or nurse practitioner who is able to sign the death certificate. If the medical examiner is able to find a medical doctor or nurse practitioner to sign the death certificate, the examiner will issue the deceased an NJA(no jurisdiction assumed) number and the disease person may be transported to our funeral home. When death happens in the hospital the procedure is very similar. Apply to the hospital for the medical certificate of death and not your family doctor..",
                textAlign: TextAlign.left,
                style:
                    TextStyle(fontSize: 15.sp, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 4.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
