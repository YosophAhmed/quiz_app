import 'package:flutter/material.dart';
import 'package:quiz/constants/colors.dart';
import 'package:quiz/data/questions_data.dart';
import 'package:quiz/widgets/custom_divider.dart';
import 'package:sizer/sizer.dart';

class QuestionContainer extends StatefulWidget {
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
  State<QuestionContainer> createState() => _QuestionContainerState();
}

class _QuestionContainerState extends State<QuestionContainer> {
  @override
  Widget build(BuildContext context) {
    bool isTrue = false;
    bool isSelected = false;
    return Padding(
      padding: EdgeInsets.only(
        top: 4.h,
        left: 4.w,
        right: 4.w,
      ),
      child: Column(
        children: [
          Text(
            'Question ${widget.questionIndex + 1}/${widget.questionsNumber}',
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
            QuestionsData.questions[widget.questionIndex].question,
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
              i < QuestionsData.questions[widget.questionIndex].answer.length;
              i++)
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 1.h,
              ),
              child: GestureDetector(
                onTap: () {
                  isSelected = true;
                  if (QuestionsData.questions[widget.questionIndex].answer.entries
                      .toList()[i]
                      .value) {
                    setState(() {
                      isTrue = true;
                    });
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? isTrue
                            ? AppColors.color['trueAnswerColor']
                            : AppColors.color['falseAnswerColor']
                        : AppColors.color['FourthColor'],
                    borderRadius: BorderRadius.circular(8.sp),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    QuestionsData.questions[widget.questionIndex].answer.keys
                        .toList()[i],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          SizedBox(
            height: 2.h,
          ),
          TextButton(
            onPressed: () {
              widget.controller.nextPage(
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

// CustomButton(
// onTap: () {
// if (QuestionsData.questions[questionIndex].answer.entries
//     .toList()[i]
//     .value) {
//
// }
// },
// label: QuestionsData.questions[questionIndex].answer.keys
//     .toList()[i],
// color: AppColors.color['secondColor']!,
// height: 45,
// ),
