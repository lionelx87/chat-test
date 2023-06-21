enum Sender {
  MY,
  YOU
}

class Message {
  final String text;
  final String? imageUrl;
  final Sender sender;

  Message({
    required this.text,
    this.imageUrl,
    required this.sender
  });

}