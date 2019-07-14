import ddf.minim.*;//サウンドAPI　ミニム  //<>//
Minim minim;
AudioPlayer player;
AudioSample mizu;
AudioSample get;
AudioSample get1;
AudioSample unlock;

int gseq;//ゲームの流れ
int mcnt;//メッセージ用カウンター

Chara chara;
Tile[] tiles =  new Tile[0];
MapChip mp1;
int number;
int point = 0;
boolean Key = false;

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

//チップサイズ
final int Chip_w = 64;
final int Chip_h = 64;

void setup() {
  size(960, 640);
  smooth();
  number = 1;
  gameInit();

  minim = new Minim(this);//サウンドの読み込み
  player = minim.loadFile("bath1.mp3");  
  player.play();  //再生
  mizu = minim.loadSample("water-drop3.mp3", 2048);
  get = minim.loadSample("touch1.mp3", 2048);
  get1 = minim.loadSample("decision1.mp3", 2048);
  unlock = minim.loadSample("decision22.mp3", 2048);
  mp1=new MapChip("chipmap.png");

  // 10*10のグリッドを作る
  for (int i = 0; i <= 9; i++) {
    for (int j = 0; j <= 9; j++) {
      Tile a = new Tile(j*Chip_w, i*Chip_h, Chip_w, Chip_h, mymap[i][j]);
      tiles = (Tile[]) append(tiles, a);//配列の末尾に追加  append(配列名, 要素);
    }
  }

  // キャラクターを生成
  chara = new Chara(64, 64, 64, 64, 64);
}

void draw() {
  background(#038ABF);
  if (gseq == 0) {
    gameTitle();
  } else if (gseq == 1) {//ステージ１
    gamePlay();
  } else if (gseq == 2) {//ステージ２
  
  } else if (gseq == 3) {//ステージ３
  
  } else {
    gameOver();
  }
}
void gameInit() {
  gseq = 0;
}

void gameTitle() {
  // gseq = 1;//デバックそのままゲームプレイへ
  mcnt++;
  if ((mcnt > 60)&&((mcnt%60) < 40)) {
    textSize(30);
    fill(40, 255, 40);
    text("Push any key!", 150, 300);
  }
}

void gamePlay() {
  Get(); 

  // グリッドを並べる
  for (int i = 0; i < tiles.length; i++) {
    tiles[i].display();
  }

  //chara表示
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
  println(mymap[8][8]);
}

void gameOver() {
  textSize(70);
  fill(255, 0, 0);
  text("GAME OVER", 60, 240);
  mcnt++;
  if ((mcnt > 60)&&((mcnt%60) < 40)) {
    textSize(30);
    fill(40, 255, 40);
    text("Push any key!", 150, 320);
  }
}

void keyPressed() {
  mizu.trigger(); 
  if (gseq ==4) {//ゲームオーバー中
    gseq = 0 ;
    mcnt = 0;
  }
  if ((gseq == 0)&&(mcnt > 60)) {//タイトル
    gseq = 1;//ゲーム開始
    mcnt = 0 ;
  }

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
    if (--number < 0) {
      number=mp1.mCount-1;
    }
  } else if (key == '+') {//+キーで次のマップチップ
    if (++number > mp1.mCount-1) {
      number=0;
    }
  }
}

void stop() {
  player.close();
  mizu.close();
  get.close();
  get1.close();
  unlock.close();
  minim.stop();
  super.stop();
}

void Get() {
  if (Key == true) {
    mymap[8][8] = 0;
  }
}

/*
 http://code.compartmental.net/minim/
 https://soundeffect-lab.info/
 http://rina.jpn.ph/~rance/directx7/directx7study/ddraw/p151.html
 */
