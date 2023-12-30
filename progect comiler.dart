// Lexical Analyzer
class Lexer {
  final String input;
  int position = 0;

  Lexer(this.input);

  String getNextToken() {
    while (position < input.length) {

      if (input[position] == ' ') {
        position++;
        continue;
      } else if (isAlpha(input[position])) {
        return scanIdentifier();
      } else {
        return scanSymbol();
      }
    }
    return null;
  }

  String scanIdentifier() {
    String result = '';
    while (position < input.length && (isAlpha(input[position]) || isDigit(input[position]))) {
      result += input[position];
      position++;
    }
    return result;
  }
  String scanSymbol() {
    String symbol = input[position];
    position++;
    return symbol;
  }

  bool isAlpha(String char) {
    return RegExp(r'[a-zA-Z_]').hasMatch(char);
  }

  bool isDigit(String char) {
    return RegExp(r'[0-9]').hasMatch(char);
  }
}

// Syntax Analyzer
class Parser {
  final Lexer lexer;

  Parser(this.lexer);

  void parse() {
    String token;
    while ((token = lexer.getNextToken()) != null) {

      print('Parsing token: $token');
    }
  }
}
void main() {
  final input = "var x = 42; if (x > 0) print('Positive');";

  final lexer = Lexer(input);
  final parser = Parser(lexer);

  parser.parse();
}