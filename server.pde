import processing.net.*;
Server svr; // サーバを管理する変数
int y = 70;
int i;

void commentGet() {
  Client c = svr.available();
  if (c != null) { // クライアントからデータが来ている
    String s = c.readString(); // 読み込む
    text(" " + s, 710, y); // 表示する
    y += 20;
  }
  
}
