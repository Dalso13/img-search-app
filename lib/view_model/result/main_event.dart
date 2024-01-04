sealed class MainEvent {
  factory MainEvent.showSnackBar(String data) = ShowSnackBar;
  factory MainEvent.showDialog(String data) = ShowDialog;
}

class ShowSnackBar implements MainEvent {
  final String data;

  ShowSnackBar(this.data);
}

class ShowDialog implements MainEvent {
  final String data;


  ShowDialog(this.data);
}