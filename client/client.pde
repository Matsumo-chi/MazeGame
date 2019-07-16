//client
import processing.net.*;
Client c;
Line line;

void setup() {
  size(500, 720);
  background(114,146,193);
  line = new Line();
  //line.show("元気？",true);
  c = new Client(this, /*"172.20.35.100"*/"127.0.0.1",5555);//ここのアドレス変える！
}

int y = 20;
void draw() {
  if (c.available() > 0) {
    String s = c.readString();
  line.show(s,false);
    y += 20;
  }
}

void mouseClicked() {
 String msg = readString();
 c.write("松本千里＞" +  msg);
 line.show(msg,true);
}

class Line { // 吹き出しを表示するクラス
  int x, y = 10; // 最初に表示する場所
  final int fontH = 15; // 文字の幅(適当)
    void show(String msg, boolean jibun) { // メッセージ表示メソッド
    int w = msg.length() * fontH; // 文字列の長さを計算
    if (jibun) { // 自分のメッセージか?
      x = width / 2; // 適当に右にする
      fill(133, 226, 73); // Lineの緑
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
      background (114, 146, 193);
      y = 10; 
      ; // 最初に戻す。スクロールするのは課題とする
    }
  }
} 
