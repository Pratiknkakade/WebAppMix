class McqData {
  final int ans;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final String question;
  final String subject;

  McqData({
    required this.ans,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
    required this.question,
    required this.subject,
  });

  String get decodedOption1 => binaryToString(option1);
  String get decodedOption2 => binaryToString(option2);
  String get decodedOption3 => binaryToString(option3);
  String get decodedOption4 => binaryToString(option4);
  String get decodedQuestion => binaryToString(question);
  String binaryToString(String binary) {
    List<int> byteValues =
        binary.split(' ').map((e) => int.parse(e, radix: 2)).toList();
    return String.fromCharCodes(byteValues);
  }

  factory McqData.fromJson(Map<String, dynamic> json) {
    return McqData(
      ans: json['ans'],
      option1: json['option1'],
      option2: json['option2'],
      option3: json['option3'],
      option4: json['option4'],
      question: json['question'],
      subject: json['subject'],
    );
  }
}

class DecodedMcqData {
  final McqData originalMcqData;

  DecodedMcqData(this.originalMcqData);

  String get decodedOption1 =>
      originalMcqData.binaryToString(originalMcqData.option1);
  String get decodedOption2 =>
      originalMcqData.binaryToString(originalMcqData.option2);
  String get decodedOption3 =>
      originalMcqData.binaryToString(originalMcqData.option3);
  String get decodedOption4 =>
      originalMcqData.binaryToString(originalMcqData.option4);
  String get decodedQuestion =>
      originalMcqData.binaryToString(originalMcqData.question);
}








//  Text('Decoded Option1: ${mcqData.decodedOption1}'),
//                         Text('Decoded Option2: ${mcqData.decodedOption2}'),
//                         Text('Decoded Option3: ${mcqData.decodedOption3}'),
//                         Text('Decoded Option4: ${mcqData.decodedOption4}'),
//                         Text('Answer: ${mcqData.ans}'),
//                         Text('Subject: ${mcqData.subject}'),









