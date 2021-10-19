class Quiz {
  String? question;
  String? answer;
  List<String>? options;

  Quiz.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json['answer'];
    options = json['options'];
  }
}