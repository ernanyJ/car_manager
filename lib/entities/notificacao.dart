class Notificacao {
  String remetente;
  String destinatario;
  String message;
  DateTime createdAt;

  Notificacao(
      {required this.remetente,
      required this.destinatario,
      required this.message,
      required this.createdAt});
}
