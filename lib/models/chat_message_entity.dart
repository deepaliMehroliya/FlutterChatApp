class ChatMessageEntity{
  String text;
  String? imageUrl;
  String id;
  int createAt;
  Author author;

  ChatMessageEntity({required this.text,this.imageUrl, required this.id, required this.createAt, required this.author});

}

class Author{
  String userName;

  Author({required this.userName});
}