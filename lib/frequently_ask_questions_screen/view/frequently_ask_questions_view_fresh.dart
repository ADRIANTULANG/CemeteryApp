import 'package:cemeteryapp/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../color_class.dart';
import '../../login_screen/view/login_screen_view.dart';

class FrequestAskQuestionsViewFresh extends StatelessWidget {
  const FrequestAskQuestionsViewFresh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Color.fromARGB(255, 247, 236, 144),
      //   title: Text("FAQ's Terms and Conditions"),
      //   centerTitle: true,
      // ),
      body: Container(
        width: 100.w,
        padding: EdgeInsets.only(left: 5.w, right: 5.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Terms and Conditions",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Welcome to Online Burial Reservation and Mapping!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "These terms and conditions outline the rules and regulations for the \nuse of OBRM's Website, located at www.burialreservationand\nmapping.online.",
                textAlign: TextAlign.left,
                maxLines: 5,
                style:
                    TextStyle(fontSize: 15.sp, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "By accessing this website we assume you accept these terms and conditions. Do not continue to use Online Burial Reservation and Mapping if you do not agree to take all of the terms and conditions stated on this page.The following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and all Agreements: 'Client', 'You' and 'Your' refers to you, the person log on this website and compliant to the Company’s terms and conditions. 'The Company', 'Ourselves', 'We', 'Our' and 'Us', refers to our Company. 'Party', 'Parties', or 'Us', refers to both the Client and ourselves. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting the Client’s needs in respect of provision of the Company’s stated services, in accordance with and subject to, prevailing law of Netherlands. Any use of the above terminology or other words in the singular, plural, capitalization and/or he/she or they, are taken as interchangeable and therefore as referring to same.",
                textAlign: TextAlign.left,
                maxLines: 30,
                style:
                    TextStyle(fontSize: 15.sp, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Cookies",
                  textAlign: TextAlign.left,
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "We employ the use of cookies. By accessing Online Burial Reservation and Mapping, you agreed to use cookies in agreement with the OBRM's Privacy Policy.Most interactive websites use cookies to let us retrieve the user’s details for each visit. Cookies are used by our website to enable the functionality of certain areas to make it easier for people visiting our website. Some of our affiliate/advertising partners may also use cookies",
                textAlign: TextAlign.left,
                maxLines: 30,
                style:
                    TextStyle(fontSize: 15.sp, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "License",
                  textAlign: TextAlign.left,
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Unless otherwise stated, OBRM and/or its licensors own the intellectual property rights for all material on Online Burial Reservation and Mapping. All intellectual property rights are reserved. You may access this from Online Burial Reservation and Mapping for your own personal use subjected to restrictions set in these terms and conditions.",
                textAlign: TextAlign.left,
                maxLines: 30,
                style:
                    TextStyle(fontSize: 15.sp, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "You must not:",
                  textAlign: TextAlign.left,
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Republish material from Online Burial Reservation and Mapping, Sell, rent or sub-license material from Online Burial Reservation and Mapping. Reproduce, duplicate or copy material from Online Burial Reservation and Mapping. Redistribute content from Online Burial Reservation and Mapping",
                textAlign: TextAlign.left,
                maxLines: 30,
                style:
                    TextStyle(fontSize: 15.sp, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "This Agreement shall begin on the date hereof. Our Terms and Conditions were created with the help of the Free Terms and Conditions Generator.",
                textAlign: TextAlign.left,
                maxLines: 30,
                style:
                    TextStyle(fontSize: 15.sp, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Parts of this website offer an opportunity for users to post and exchange opinions and information in certain areas of the website. OBRM does not filter, edit, publish or review Comments prior to their presence on the website. Comments do not reflect the views and opinions of OBRM, its agents and/or affiliates. Comments reflect the views and opinions of the person who post their views and opinions. To the extent permitted by applicable laws, OBRM shall not be liable for the Comments or for any liability, damages or expenses caused and/or suffered as a result of any use of and/or posting of and/or appearance of the Comments on this website.",
                textAlign: TextAlign.left,
                maxLines: 30,
                style:
                    TextStyle(fontSize: 15.sp, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "OBRM reserves the right to monitor all Comments and to remove any Comments which can be considered inappropriate, offensive or causes breach of these Terms and Conditions.",
                textAlign: TextAlign.left,
                maxLines: 30,
                style:
                    TextStyle(fontSize: 15.sp, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "F A Q's",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 2.h,
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
                "Simply click the sign up in the login page and create an account if you don't already have one",
                textAlign: TextAlign.left,
                style:
                    TextStyle(fontSize: 15.sp, fontWeight: FontWeight.normal),
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
              InkWell(
                onTap: () {
                  Get.find<StorageServices>()
                      .alreadyReadFAQsAndTermsAndServices();
                  Get.to(() => LoginScreen());
                },
                child: Container(
                  height: 8.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: AppColor.mainColors,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.black54)),
                  alignment: Alignment.center,
                  child: Text(
                    "I have read and Agree",
                    style: TextStyle(
                      letterSpacing: 0,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
