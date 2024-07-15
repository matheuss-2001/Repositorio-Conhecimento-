abstract class Failure {
  final String? title;
  final String? message;

  Failure(this.title, this.message);
}

class GenericFailure extends Failure {
  GenericFailure(String? title, String? message)
      : super(title ?? 'Atenção', message ?? 'Erro desconhecido');
}

class InternetConnectionError extends Failure {
  InternetConnectionError()
      : super('Atenção', 'Sem conexão, verifique sua internet.');
}

class ServidorConnectionError extends Failure {
  ServidorConnectionError()
      : super(
            'Atenção', 'Conexão fraca, por favor tente novamente mais tarde.');
}

class TimeOutError extends Failure {
  TimeOutError([String? statusCode])
      : super('Atenção',
            'Excedido tempo de resposta, por favor tente novamente.');
}
