import 'package:flutter/material.dart';
import 'package:quiz/constants/colors.dart';
import 'package:sizer/sizer.dart';

import '../data/questions_data.dart';
import '../widgets/question_container.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'HomePage';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(
      initialPage: 0,
    );
    return Scaffold(
      backgroundColor: AppColors.color['firstColor'],
      appBar: AppBar(
        title: Text(
          'Quiz App',
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
      body: PageView.builder(
        controller: pageController,
        itemCount: QuestionsData.questions.length,
        itemBuilder: (context, index) {
          return QuestionContainer(
            questionsNumber: QuestionsData.questions.length,
            questionIndex: index,
            controller: pageController,
          );
        },
      )
    );
  }
}


