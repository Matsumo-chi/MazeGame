import processing.net.*;
Server svr; // サーバを管理する変数
int y = 90;
int i;

void commentGet() {
  Client c = svr.available();
  if (c != null) { // クライアントからデータが来ている
    String s = c.readString(); // 読み込む
    stroke(#D7EAF2);
    strokeWeight(2);
    noFill();
    rect(700, y-40, 200, 50, 10);
    triangle(900, y+6, 910, y+20, 890, y+10);
    noStroke();
    fill(#038ABF);
    rect(891, y, 8, 11);
    textSize(25);
    fill(#D7EAF2);
    text(s, 710, y); // 表示する
    y += 60;
    if (y > height) { // 一番したまで来たのでクリアする
      fill(#038ABF);
      rect(640, 0, 960, 960);
      y = 90;
    }
    if (s.equals("up") == true || s.equals("うえ") == true || s.equals("上") == true) {
      println("ok_up");
      chara.move("up");
    } 
    if (s.equals("down") == true || s.equals("した") == true || s.equals("下") == true) { 
      println("ok_down");
      chara.move("down");
    } 
    if (s.equals("left") == true || s.equals("ひだり") == true || s.equals("左") == true) { 
      println("ok_left");
      chara.move("left");
      return;
    } 
    if (s.equals("right") == true || s.equals("みぎ") == true || s.equals("右") == true) { 
      println("ok_right");
      chara.move("right");
    }
  }
}
