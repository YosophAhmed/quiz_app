import 'package:flutter/material.dart';
import 'package:quiz/constants/colors.dart';
import 'package:quiz/data/questions_data.dart';
import 'package:quiz/pages/result_page.dart';
import 'package:quiz/widgets/custom_divider.dart';
import 'package:sizer/sizer.dart';

class QuestionContainer extends StatefulWidget {
  final int questionsNumber;
  final int questionIndex;
  final PageController controller;


  QuestionContainer({
    Key? key,
    required this.questionsNumber,
    required this.questionIndex,
    required this.controller,
  }) : super(key: key);

  @override
  State<QuestionContainer> createState() => _QuestionContainerState();
}

class _QuestionContainerState extends State<QuestionContainer> {
  bool isPressed = false;
  Color trueAnswer = AppColors.color['trueAnswerColor']!;
  Color wrongAnswer = AppColors.color['falseAnswerColor']!;
  Color bottonColor = AppColors.color['fourthColor']!;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 4.h,
        left: 4.w,
        right: 4.w,
        bottom: 1.h,
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
            height: 4.h,
          ),
          for (int i = 0;
              i < QuestionsData.questions[widget.questionIndex].answer.length;
              i++)
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 1.h,
              ),
              child: GestureDetector(
                onTap: isPressed
                    ? () {}
                    : () {
                        setState(() {
                          isPressed = true;
                        });
                        if (QuestionsData
                            .questions[widget.questionIndex].answer.entries
                            .toList()[i]
                            .value) {
                          QuestionsData.countResult(10);
                          setState(() {
                            bottonColor = trueAnswer;
                          });
                        } else {
                          setState(() {
                            bottonColor = wrongAnswer;
                          });
                        }
                      },
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: isPressed
                        ? QuestionsData
                                .questions[widget.questionIndex].answer.entries
                                .toList()[i]
                                .value
                            ? trueAnswer
                            : wrongAnswer
                        : bottonColor,
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
          const Spacer(),
          if (widget.questionIndex + 1 == QuestionsData.questions.length)
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  ResultPage.routeName,
                );
              },
              child: Text(
                'Your Result',
                style: TextStyle(
                  color: AppColors.color['fourthColor'],
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          if (widget.questionIndex + 1 != QuestionsData.questions.length)
            TextButton(
              onPressed: () {
                setState(() {
                  isPressed = false;
                });
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
