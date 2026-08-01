class MathQuestion {
  final String question;
  final List<String> options;
  final int answer;

  const MathQuestion({
    required this.question,
    required this.options,
    required this.answer,
  });
}

const List<MathQuestion> chapter1Quiz = [

  MathQuestion(
    question: "Which is the largest 4-digit number?",
    options: [
      "999",
      "9999",
      "1000",
      "9990",
    ],
    answer: 1,
  ),

  MathQuestion(
    question: "1,00,000 is called?",
    options: [
      "Thousand",
      "Million",
      "Lakh",
      "Crore",
    ],
    answer: 2,
  ),

  MathQuestion(
    question: "1,00,00,000 is called?",
    options: [
      "Million",
      "Crore",
      "Lakh",
      "Billion",
    ],
    answer: 1,
  ),

  MathQuestion(
    question: "How many digits are there in 54,32,189?",
    options: [
      "6",
      "7",
      "8",
      "9",
    ],
    answer: 1,
  ),

  MathQuestion(
    question: "Which number is greater?",
    options: [
      "54,321",
      "45,321",
      "34,521",
      "25,431",
    ],
    answer: 0,
  ),

  MathQuestion(
    question: "Which symbol is used in Roman Numerals for 10?",
    options: [
      "V",
      "X",
      "L",
      "C",
    ],
    answer: 1,
  ),

  MathQuestion(
    question: "Which is the smallest natural number?",
    options: [
      "0",
      "1",
      "2",
      "10",
    ],
    answer: 1,
  ),

  MathQuestion(
    question: "Which place comes after Thousands?",
    options: [
      "Hundreds",
      "Lakhs",
      "Ten Thousands",
      "Crores",
    ],
    answer: 2,
  ),

  MathQuestion(
    question: "Zero was invented in?",
    options: [
      "India",
      "USA",
      "China",
      "Japan",
    ],
    answer: 0,
  ),

  MathQuestion(
    question: "Which number system uses Lakh and Crore?",
    options: [
      "American",
      "Indian",
      "British",
      "French",
    ],
    answer: 1,
  ),

];