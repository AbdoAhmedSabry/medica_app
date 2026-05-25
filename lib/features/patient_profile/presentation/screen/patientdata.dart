import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medica/config/theme/app_colors.dart';
import 'package:medica/config/theme/app_text_styles.dart';
import 'package:medica/features/auth/presentation/widgets/auth_button.dart';
import 'package:medica/features/auth/presentation/widgets/custom_textfield.dart';
import 'package:medica/features/patient_profile/presentation/widgets/customdrop.dart';

class PatientDataScreen extends StatefulWidget {
  const PatientDataScreen({super.key});

  @override
  State<PatientDataScreen> createState() => _PatientDataScreenState();
}

class _PatientDataScreenState extends State<PatientDataScreen> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController chronicDiseasesController =
      TextEditingController();
  String? selectedBloodType;
  String? selectedGender;
  String? selectedBloodPressure;
  String? selectedDiabetes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Please Enter Your Data ",
                    style: AppTextStyles.font26Bold.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
                SizedBox(height: 37.h),
                CustomTextfield(
                  controller: heightController,
                  label: "height ",
                  hintText: "Enter your height",
                ),

                SizedBox(height: 14.h),

                CustomTextfield(
                  controller: weightController,
                  label: "weight ",
                  hintText: "Enter your weight",
                ),
                SizedBox(height: 14.h),
                CustomTextfield(
                  controller: ageController,
                  label: "age ",
                  hintText: "Enter your age",
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 14.h),
                CustomTextfield(
                  controller: chronicDiseasesController,
                  label: "Chronic diseases ",
                  hintText: "if no diseases enter:none",
                ),
                SizedBox(height: 14.h),
                CustomDropdown(
                  hintText: "Select blood type",
                  items: const [
                    "A+",
                    "A-",
                    "B+",
                    "B-",
                    "AB+",
                    "AB-",
                    "O+",
                    "O-",
                  ],
                  selectedValue: selectedBloodType,
                  onChanged: (value) {
                    setState(() {
                      selectedBloodType = value;
                    });
                  },
                ),

                SizedBox(height: 14.h),

                CustomDropdown(
                  hintText: "Blood Pressure",
                  items: const ["yes", "no"],
                  selectedValue: selectedBloodPressure,
                  onChanged: (value) {
                    setState(() {
                      selectedBloodPressure = value;
                    });
                  },
                ),
                SizedBox(height: 14.h),
                CustomDropdown(
                  hintText: 'Gender',
                  items: ['male', 'female'],
                  selectedValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                ),
                SizedBox(height: 14.h),

                CustomDropdown(
                  hintText: "hasDiabetes",
                  items: ["yes", "no"],
                  selectedValue: selectedDiabetes,
                  onChanged: (value) {
                    setState(() {
                      selectedDiabetes = value;
                    });
                  },
                ),
                SizedBox(height: 14.h),

                SizedBox(
                  height: 50.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "I agreeto the ",
                        style: AppTextStyles.font16Regular.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // navigate to terms and conditions screen
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => const TermsAndConditionsScreen()));
                        },
                        child: Text(
                          "Terms & Conditions",
                          style: AppTextStyles.font16Regular.copyWith(
                            color: AppColors.primary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      Text(
                        " and ",
                        style: AppTextStyles.font16Regular.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "Privacy Policy",
                          style: AppTextStyles.font16Regular.copyWith(
                            color: AppColors.primary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 14.h),
                CustomButton(text: "Confirm", onTap: () {}),
                SizedBox(height: 37.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
