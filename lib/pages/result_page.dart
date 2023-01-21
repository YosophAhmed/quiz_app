import 'package:flutter/material.dart';
import 'package:quiz/data/questions_data.dart';
import 'package:quiz/pages/home_page.dart';
import 'package:quiz/widgets/custom_divider.dart';
import 'package:sizer/sizer.dart';

import '../constants/colors.dart';

class ResultPage extends StatelessWidget {
  static const String routeName = 'ResultScreen';

  const ResultPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color['firstColor'],
      appBar: AppBar(
        title: Text(
          'Quiz Result',
          style: TextStyle(
            fontSize: 32.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.color['fourthColor'],
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 20.h,),
        child: Column(
          children: [
            Text(
              'Your Score is',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 34,
                color: AppColors.color['fourthColor'],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.color['secondColor'],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${QuestionsData.result.toString()}/${QuestionsData.questions.length * 10}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 70,
                    color: AppColors.color['fourthColor'],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            CustomDivider(
              color: AppColors.color['fourthColor']!,
              thickness: 4,
            ),
            SizedBox(
              height: 1.h,
            ),
            TextButton(
              onPressed: () {
                QuestionsData.result = 0;
                Navigator.pushReplacementNamed(context, HomePage.routeName);
              },
              child: Text(
                'Retry quiz ?',
                style: TextStyle(
                  color: AppColors.color['fourthColor'],
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
