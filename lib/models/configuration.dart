abstract class Configuration {
  String question;
  String? description;
  int? estimation;

  Configuration(this.question, {this.description, this.estimation});

  String generateSpecifications();
}
