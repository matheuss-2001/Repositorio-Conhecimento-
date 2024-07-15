abstract class Failure {
  final String? title;
  final String? message;

  Failure(this.title, this.message);
}

class GenericFailure extends Failure {
  GenericFailure(String? title, String? message)
      : super(title ?? 'Atenção', message ?? 'Erro desconhecido');
}

class TimeOutError extends Failure {
  TimeOutError([String? statusCode])
      : super('Atenção',
            'Excedido tempo de resposta, por favor tente novamente.');
}
