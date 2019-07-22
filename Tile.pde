class Tile1 {
  float x, y, w, h, v;
  int number;
  Tile1(float tempX, float tempY, float tempW, float tempH, int tempValue) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    v = tempValue;
  }

  void display() {
    PImage mapChip = mp1.getMapChip(number);
    if (v == 0) {
      number=0;//道
    }
    if (v == 1) {
      number=1;//壁横
    }
    if (v == 2) {
      number=2;//壁縦
    }    
    if (v == 3) {
      number = 3;//柵
    }    
    if (v == 4) {
      number = 4;//縦柵
    }   
    if (v == 5) {
      number = 5;//横柵
    }
    if (v == 15) {
      number = 15;//ブロック
    }
    if (v == 16) {
      number = 16;//カギドア
    }
    if (v == 20) {
      number=20;//草1
    }
    if (v == 21) {
      number=21;//草1
    }
    if (v == 22) {
      number=22;//階段
    }
    if (v == 23) {
      number = 23;//ポイント
    }
    if (v == 24) {
      number = 24;//鍵
    }
    image(mapChip, x, y, w, h);
  }
}

class Tile2 {
  float x, y, w, h, v;
  int number;
  Tile2(float tempX, float tempY, float tempW, float tempH, int tempValue) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    v = tempValue;
  }

  void display() {
    PImage mapChip = mp1.getMapChip(number);
    if (v == 0) {
      number=0;//道
    }
    if (v == 1) {
      number=1;//壁横
    }
    if (v == 2) {
      number=2;//壁縦
    }    
    if (v == 3) {
      number = 3;//柵
    }    
    if (v == 4) {
      number = 4;//縦柵
    }   
    if (v == 5) {
      number = 5;//横柵
    }
    if (v == 15) {
      number = 15;//ブロック
    }
    if (v == 16) {
      number = 16;//カギドア
    }
    if (v == 20) {
      number=20;//草1
    }
    if (v == 22) {
      number=22;//階段
    }
    if (v == 23) {
      number = 23;//ポイント
    }
    if (v == 24) {
      number = 24;//鍵
    }
    image(mapChip, x, y, w, h);
  }
}
