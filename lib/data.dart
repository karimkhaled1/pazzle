
class Data {
  int x, y;
  int position;
  int rightPosition;
  String imagePath;
  Data(this.x, this.y, this.position, this.rightPosition,this.imagePath);
  toString() {
    return " x:" +
        x.toString() +
        " y:" +
        y.toString() +
        " pos:" +
        position.toString()+" right :"+rightPosition.toString();
  }
}
