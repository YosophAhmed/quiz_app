import 'package:flutter/material.dart';
import 'package:quiz/constants/colors.dart';
import 'package:quiz/cubit/app_cubit.dart';
import 'package:quiz/data/questions_data.dart';
import 'package:quiz/widgets/custom_button.dart';
import 'package:quiz/widgets/custom_divider.dart';
import 'package:sizer/sizer.dart';

class QuestionContainer extends StatelessWidget {
  final int questionsNumber;
  final int questionIndex;
  final PageController controller;

  const QuestionContainer({
    Key? key,
    required this.questionsNumber,
    required this.questionIndex,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 4.h,
        left: 4.w,
        right: 4.w,
      ),
      child: Column(
        children: [
          Text(
            'Question ${questionIndex + 1}/$questionsNumber',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.color['fourthColor'],
            ),
            textAlign: TextAlign.center,
          ),
          CustomDivider(
            color: AppColors.color['fourthColor']!,
            thickness: 4.0,
          ),
          Text(
            QuestionsData.questions[questionIndex].question,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: AppColors.color['fourthColor'],
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          for (int i = 0;
              i < QuestionsData.questions[questionIndex].answer.length;
              i++)
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 1.h,
              ),
              child: CustomButton(
                onTap: () {},
                label: QuestionsData.questions[questionIndex].answer.keys
                    .toList()[i],
                color: AppColors.color['secondColor']!,
                height: 45,
              ),
            ),
          SizedBox(
            height: 2.h,
          ),
          TextButton(
            onPressed: () {
              controller.nextPage(
                duration: const Duration(milliseconds: 100),
                curve: Curves.linear,
              );
            },
            child: Text(
              'Next Question',
              style: TextStyle(
                color: AppColors.color['fourthColor'],
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
