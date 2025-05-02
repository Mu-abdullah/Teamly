enum Vactions { annual, exceptional, sick, maternity }

enum VactionsStatus { approved, rejected, pending }

class VactionsTypes {
  static String getType(Vactions type) => type.name;

  static String getStatus(VactionsStatus status) => status.name;
}
