//client
import processing.net.*;
Client c;
Message message;
PFont font; //フォント

void setup() {
  size(500, 720);
  background(#038ABF);
  message = new Message();
  font = loadFont("NuAnkoMochi-Square-1-48.vlw"); 
  textFont(font, 16); 
  message.show("チャットからキャラを動かそう", true);
  c = new Client(this, /*"172.20.35.145"*/"192.168.11.4",5555 );//ここのアドレス変える！
}

int y = 20;
void draw() {
  if (c.available() > 0) {
    String s = c.readString();
    message.show(s, false);
    y += 20;
  }
}

void mouseClicked() {
  String msg = readString();
  c.write(msg);
  message.show(msg, true);
}

class Message { // 吹き出しを表示するクラス
  int x, y = 10; // 最初に表示する場所
  final int fontH = 15; // 文字の幅(適当)
  void show(String msg, boolean jibun) { // メッセージ表示メソッド
    int w = msg.length() * fontH; // 文字列の長さを計算
    if (jibun) { // 自分のメッセージか?
      x = width / 2; // 適当に右にする
      fill(#D7EAF2);
    } else { // 他の人のメッセージ
      x = 20;
      fill(255); // 白
    }
    // 吹き出しの描画とメッセージの表示
    noStroke();
    rect (x, y, w, fontH + 4, 10);
    fill(0);
    text(msg, x + fontH/2, y + fontH);
    y += fontH + 10; // 下にずらす
    if (y > height) { // 一番したまで来たのでクリアする
      background (#038ABF);
      y = 10;
    }
  }
} 
