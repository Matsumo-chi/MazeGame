Car car;
Tile[] tiles =  new Tile[0];
MapChip mp1;
boolean showOneTime;
int number;

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
  { 2, 0, 20, 0, 0, 0, 0, 0, 0, 2}, 
  { 2, 2, 0, 1, 1, 1, 0, 0, 0, 2 }, 
  { 2, 0, 0, 2, 0, 2, 0, 2, 0, 2 }, 
  { 2, 0, 1, 1, 0, 1, 1, 1, 0, 2 }, 
  { 2, 0, 2, 0, 0, 0, 2, 0, 0, 2 }, 
  { 2, 0, 2, 22, 2, 0, 2, 0, 2, 2 }, 
  { 2, 0, 1, 1, 1, 0, 2, 0, 0, 2 }, 
  { 2, 0, 0, 0, 0, 0, 2, 2, 0, 2 }, 
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
  car = new Car(64, 64, 64, 64, color(255, 255, 255), 64);
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
  car.display(); 

  //デバック用
  fill(0);
  rect(700, 40, 140, 150);
  fill(255);
  text("MapChip: "+number+" / "+mp1.mCount, 730, 70);
  PImage mapChip = mp1.getMapChip(number);  
  image(mapChip, 740, 80, 64, 64);//表示
  
}

void keyPressed() {

  if (keyCode == UP) { 
    car.move("up");
  }
  if (keyCode == DOWN) { 
    car.move("down");
  } 
  if (keyCode == LEFT) { 
    car.move("left");
  } 
  if (keyCode == RIGHT) { 
    car.move("right");
  }


//デバック用
  if (key == '-'){//-キーで前のマップチップ
    if (--number<0) {
      number=mp1.mCount-1;
    }
  } else if (key == '+') {//+キーで次のマップチップ
    if (++number>mp1.mCount-1) {
      number=0;
    }
  }
  
  
}

class Car {
  float x, y, w, h;
  color c;
  float s;

  Car(float tempX, float tempY, float tempW, float tempH, color tempColor, float tempSpeed) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    c = tempColor;
    s = tempSpeed;
  }

void display() {
    fill(c);
    noStroke();
    ellipseMode(CORNER);
    ellipse(x, y, w, h);
  }

void move(String direction) {
    if (keyPressed) {
      // 方向
      if (direction == "up") {
        for (int i = 0; i < tiles.length; i++) {
          if ((car.x == tiles[i].x) && (car.y == tiles[i].y)) {
            if (tiles[i-10].v == 0 || tiles[i-10].v == 20) {
              car.y = car.y - s;
              break;
            }
          }
        }
      }
      if (direction == "down") {
        for (int i = 0; i < tiles.length; i++) {
          if ((car.x == tiles[i].x) && (car.y == tiles[i].y)) {
            if (tiles[i + 10].v == 0 || tiles[i+10].v == 20) {
              car.y = car.y + s;
              break;
            }
          }
        }
      }
      if (direction == "left") {
        for (int i = 0; i < tiles.length; i++) {
          if ((car.x == tiles[i].x) && (car.y == tiles[i].y)) {
            if (tiles[i-1].v == 0 || tiles[i-1].v == 20) {
              car.x = car.x - s;
              break;
            }
          }
        }
      }
      if (direction == "right") {
        for (int i = 0; i < tiles.length; i++) {
          if ((car.x == tiles[i].x) && (car.y == tiles[i].y)) {
            if (tiles[i+1].v == 0 || tiles[i+1].v == 20) {
              car.x = car.x + s;
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
    if (v == 20) {
      number=20;//草1
    }
    if (v == 22) {
      number=22;//階段
    }
    image(mapChip, x, y, w, h);
  }
}
