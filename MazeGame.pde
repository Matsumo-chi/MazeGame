Chara chara;
Tile[] tiles =  new Tile[0];
MapChip mp1;
boolean showOneTime;
int number;
int point=0;
int Key=0;

class MapChip {
  //集合画像本体
  PImage mapChipArray;
  //マップチップの総数、並びの幅、縦の数
  int mCount, mWidth, mHeight;

  //コンストラクタには集合画像のファイル名を与える
  MapChip(String file) {
    mapChipArray=loadImage(file);
    mWidth=mapChipArray.width/Chip_w; //画像に含まれるマップチップの横並び数 
    mHeight=mapChipArray.height/Chip_h; //マップチップの縦の数 
    mCount=mWidth * mHeight; //画像に含まれるマップチップの総数
  }    
  //「番号」を与えて画像を得る
  //マップチップ総数を超えたらnullになる
  PImage getMapChip(int number) {
    if (number>=mCount) {
      return null;
    }
    //「番号」から画像の位置を求める
    int w=(number % mHeight)*Chip_w;
    int h=(number / mWidth)*Chip_h;
    return mapChipArray.get( w, h, Chip_w, Chip_h);//PImage::get()で画像を切り出す
  }
}



// マップ元データ
/*
0=道
 1=壁
 2=
 */
int[][] mymap = {

  { 2, 1, 1, 1, 1, 1, 1, 1, 1, 2 }, 
  { 2, 0, 20, 0, 0, 0, 0, 23, 0, 2}, 
  { 2, 1, 0, 1, 1, 1, 0, 0, 0, 2 }, 
  { 2, 0, 0, 2, 0, 2, 0, 2, 0, 2 }, 
  { 2, 0, 1, 1, 0, 1, 1, 1, 0, 2 }, 
  { 2, 0, 2, 0, 0, 0, 2, 0, 0, 2 }, 
  { 2, 0, 2, 22, 2, 0, 2, 0, 1, 2 }, 
  { 2, 0, 1, 1, 1, 16, 2, 0, 0, 2 }, 
  { 2, 0, 0, 0, 0, 0, 2, 2, 24, 2 }, 
  { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }

};

// Tile size
final int Chip_w = 64;
final int Chip_h = 64;

void setup() {
  size(960, 640);
  smooth();
  mp1=new MapChip("chipmap.png");
  number=1;
  // 10*10のグリッドを作る
  for (int i = 0; i <= 9; i++) {
    for (int j = 0; j <= 9; j++) {
      Tile a = new Tile(j*Chip_w, i*Chip_h, Chip_w, Chip_h, mymap[i][j]);
      tiles = (Tile[]) append(tiles, a);//配列の末尾に追加  append(配列名, 要素);
    }
  }

  // Create car object
  chara = new Chara(64, 64, 64, 64, 64);
}

void draw() {
  background(#038ABF);
  //デバック用 
  if (!showOneTime) { //最初3秒間全体画像を表示
    image(mp1.mapChipArray, 0, 0);
    if (millis()>1000) {
      showOneTime=true;
    } 
    return;
  }   

  // グリッドを並べる
  for (int i = 0; i < tiles.length; i++) {
    tiles[i].display();
  }

  // Display car
  chara.display(); 

  //デバック用
  fill(0);
  rect(700, 40, 140, 150);
  fill(255);
  text("MapChip: "+number+" / "+mp1.mCount, 730, 70);
  PImage mapChip = mp1.getMapChip(number);  
  image(mapChip, 740, 80, 64, 64);//表示
  println(point);
  println(Key);
}

void keyPressed() {

  if (keyCode == UP) { 
    chara.move("up");
  }
  if (keyCode == DOWN) { 
    chara.move("down");
  } 
  if (keyCode == LEFT) { 
    chara.move("left");
  } 
  if (keyCode == RIGHT) { 
    chara.move("right");
  }


  //デバック用
  if (key == '-') {//-キーで前のマップチップ
    if (--number<0) {
      number=mp1.mCount-1;
    }
  } else if (key == '+') {//+キーで次のマップチップ
    if (++number>mp1.mCount-1) {
      number=0;
    }
  }
}

class Chara {
  float x, y, w, h;
  float s;
  int number;
  Chara(float tempX, float tempY, float tempW, float tempH, float tempSpeed) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    s = tempSpeed;
  }
  //charaの表示
  void display() {
    PImage mapChip = mp1.getMapChip(number);
    number=30;//チップのキャラ番号 //<>//
    image(mapChip, x, y, w, h);
    number++; 
    // ループ処理
    if (number == 33) {
      number = 30;
    }
   image(mapChip, x, y, w, h);
  }

  void move(String direction) {
    if (keyPressed) {
      // 方向
      if (direction == "up") {
        for (int i = 0; i < tiles.length; i++) {
          if ((chara.x == tiles[i].x) && (chara.y == tiles[i].y)) {
            if (tiles[i-10].v == 0 || tiles[i-10].v == 20) {
              chara.y = chara.y - s;
              break;
            } else if (tiles[i-10].v == 23) {
              chara.y = chara.y - s;
              point = 1;
              break;
            } else if (tiles[i-10].v == 24) {
              chara.y = chara.y - s;
              Key = 1;
              break;
            }
          }
        }
      }
      if (direction == "down") {
        for (int i = 0; i < tiles.length; i++) {
          if ((chara.x == tiles[i].x) && (chara.y == tiles[i].y)) {
            if (tiles[i + 10].v == 0 || tiles[i+10].v == 20) {
              chara.y = chara.y + s;
              break;
            } else if (tiles[i+10].v == 23) {
              chara.y = chara.y + s;
              point = 1;
              break;
            } else if (tiles[i+10].v == 24) {
              chara.y = chara.y + s;
              Key = 1;
              break;
            }
          }
        }
      }
      if (direction == "left") {
        for (int i = 0; i < tiles.length; i++) {
          if ((chara.x == tiles[i].x) && (chara.y == tiles[i].y)) {
            if (tiles[i-1].v == 0 || tiles[i-1].v == 20) {
              chara.x = chara.x - s;
              break;
            } else if (tiles[i-10].v == 23) {
              chara.x = chara.x - s;
              point = 1;
              break;
            } else if (tiles[i-10].v == 24) {
              chara.x = chara.y - s;
              Key = 1;
              break;
            }
          }
        }
      }
      if (direction == "right") {
        for (int i = 0; i < tiles.length; i++) {
          if ((chara.x == tiles[i].x) && (chara.y == tiles[i].y)) {
            if (tiles[i+1].v == 0 || tiles[i+1].v == 20) {
              chara.x = chara.x + s;
              break;
            } else if (tiles[i+10].v == 23) {
              chara.x = chara.x + s;
              point = 1;
              break;
            } else if (tiles[i+10].v == 24) {
              chara.x = chara.x + s;
              Key = 1;
              break;
            }
          }
        }
      }
    }
  }
}


class Tile {
  float x, y, w, h, v;
  int number;
  Tile(float tempX, float tempY, float tempW, float tempH, int tempValue) {
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
