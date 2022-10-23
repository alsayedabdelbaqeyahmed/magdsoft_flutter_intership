// failure file contain contract class that will be implemented eny time
// according to the type of error local or server

abstract class Failur {
  final String? errorMessege;

  const Failur({this.errorMessege});
}

class ServerFailur extends Failur {
  const ServerFailur({super.errorMessege});
}

class LocalFailur extends Failur {
  const LocalFailur({super.errorMessege});
}
