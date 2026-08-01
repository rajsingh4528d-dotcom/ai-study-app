class Chapter1MCQ {

  final String question;
  final List<String> options;
  final int answer;

  const Chapter1MCQ({
    required this.question,
    required this.options,
    required this.answer,
  });

}

const List<Chapter1MCQ> chapter1MCQs = [

  Chapter1MCQ(

    question: "Largest 5-digit number is?",

    options: [

      "9999",

      "99999",

      "10000",

      "90000"

    ],

    answer: 1,

  ),

  Chapter1MCQ(

    question: "Smallest 6-digit number is?",

    options: [

      "100000",

      "99999",

      "10000",

      "999999"

    ],

    answer: 0,

  ),

];