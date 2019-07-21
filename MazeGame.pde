import ddf.minim.*;//サウンドAPI　ミニム //<>//
Minim minim;
AudioPlayer player;
AudioSample mizu;
AudioSample get;
AudioSample get1;
AudioSample unlock;
PFont font; //フォント
int gseq;//ゲームの流れ
int mcnt;//メッセージ用カウンター
int numBubbles = 50;
Bubble[] bubbles;
Chara chara;
Tile1[] tiles1 =  new Tile1[0];
Tile2[] tiles2 =  new Tile2[0];
MapChip mp1;
int number;
int point = 0;
boolean Key = false;

final int Chip_w = 64;//チップサイズ
final int Chip_h = 64;

void setup() {
  svr = new Server(this, 5555); // サーバを立ち上げる
  size(960, 640);
  number = 1;
  font = loadFont("NuAnkoMochi-Square-1-48.vlw"); 
  textFont(font, 32); 
  gameInit();
  minim = new Minim(this);//サウンドの読み込み
  player = minim.loadFile("bath1.mp3");  
  player.play();  //再生
  mizu = minim.loadSample("water-drop3.mp3", 2048);
  get = minim.loadSample("touch1.mp3", 2048);
  get1 = minim.loadSample("decision1.mp3", 2048);
  unlock = minim.loadSample("decision22.mp3", 2048);
  mp1=new MapChip("mapchip.png");//マップチップの読み込み
  bubbles = new Bubble[numBubbles];
  for (int i = 0; i < numBubbles; i++) {
    bubbles[i] = new Bubble();
  }
}

void draw() {
  smooth();
  if (gseq == 0) {
    gameTitle();
  } else if (gseq == 1) {//でステージ１
    gamePlay1();
  } else if (gseq == 2) {//ステージクリア
    stageclear();
  } else if (gseq == 3) {//ステージ2
    gamePlay2();
  } else if (gseq == 111) {//デバックモード
    debug();
  } else {
    gameOver();
  }
}
void gameInit() {
  gseq = 0;
}

void gameTitle() {
  PImage title = loadImage("title.png");
  image(title, 0, 0);
  for (int i = 0; i < bubbles.length; i++) {
    bubbles[i].update();
    bubbles[i].render();
    if ( bubbles[i].loc.y < -50) {
      bubbles[i].reset();
    }
  }
  noStroke();
  fill(#D7EAF2);
  rect( 286, 425, 162, 40);
  rect( 512, 425, 162, 40);
  fill(#0377BF);
  textSize(30);
  text("play", 330, 450);
  text("debug", 540, 450);
}

void gamePlay1() {//ステージ1
  fill(#038ABF);
  noStroke();
  rect(0, 0, 650, 650);
  text("stage1", 730, 500);
  Get(); 
  // グリッドを並べる
  for (int i = 0; i < tiles1.length; i++) {
    tiles1[i].display();
  }
  //chara表示
  chara.display(); 
  //println(point);
  //println(Key);
  //println(mymap[8][8]);
  fill(#D7EAF2);
  commentGet();
}

void gamePlay2() {//ステージ2
  fill(#038ABF);
  noStroke();
  rect(0, 0, 650, 650);
  text("stage2", 730, 500);
  chara.update();
  // 10*10のグリッドを作る
  for (int i = 0; i <= 9; i++) {
    for (int j = 0; j <= 9; j++) {
      Tile2 a = new Tile2(j*Chip_w, i*Chip_h, Chip_w, Chip_h, mymap2[i][j]);
      tiles2 = (Tile2[]) append(tiles2, a);//配列の末尾に追加  append(配列名, 要素);
    }
  }
  Get(); 
  for (int i = 0; i < tiles2.length; i++) {
    tiles2[i].display();
  }
  chara.display();
  commentGet();
}

void stageclear() {
  background(#038ABF);
  fill(255);
  textSize(100);
  text("clear!!", width/2-150, 200);
  textSize(30);
  text("go nextstage", width/2-100, height/2);
  mcnt++;
  if ((mcnt > 60)&&((mcnt%60) < 40)) {
    fill(255);
    text("Push any key!", width/2-100, height/2+100);
  }
  strokeWeight(1);
  for (int i = 0; i < bubbles.length; i++) {
    bubbles[i].update();
    bubbles[i].render();
    if ( bubbles[i].loc.y < -50) {
      bubbles[i].reset();
    }
  }
}

void gameOver() {
  textSize(30);
  fill(255, 0, 0);
  text("GAME OVER", 60, 240);
  mcnt++;
  if ((mcnt > 60)&&((mcnt%60) < 40)) {
    fill(255);
    text("Push any key!", 150, 320);
  }
}

void debug() {
  background(#038ABF);
  fill(0);
  rect(650, 40, 250, 150);
  fill(255);
  textSize(20);
  text("MapChip: "+number+" / "+mp1.mCount, 680, 70);
  PImage mapChip = mp1.getMapChip(number);  
  image(mapChip, 740, 80, 64, 64);
}

void stage1_start() {
  background(#038ABF);
  // 10*10のグリッドを作る
  for (int i = 0; i <= 9; i++) {
    for (int j = 0; j <= 9; j++) {
      Tile1 a = new Tile1(j*Chip_w, i*Chip_h, Chip_w, Chip_h, mymap1[i][j]);
      tiles1 = (Tile1[]) append(tiles1, a);//配列の末尾に追加  append(配列名, 要素);
    }
  }
  chara = new Chara(64*1, 64*5, 64, 64, 64);
}

void mouseClicked() {
  if ( mouseButton == LEFT ) {
    if (286 <= mouseX && mouseX <= 488) {
      if (425 <= mouseY && mouseY <= 465) {
        stage1_start();
        gseq = 1;
      }
    }
  }
  if ( mouseButton == LEFT ) {
    if (512 <= mouseX && mouseX <= 674) {
      if (425 <= mouseY && mouseY <= 465) {
        background(#038ABF);
        gseq = 111;
      }
    }
  }
}

void keyPressed() {
  mizu.trigger(); 
  if (gseq == 2) {
    fill(#038ABF);
    rect(640, 0, 960, 960);
    gseq = 3;
  } else if (keyCode == ENTER && gseq == 111) {
    gseq = 0;
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

  //デバックモード用
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
    //mymap[8][8] = 0;
  }
}
void reset() {
  Key = false;
  point = 0;
}

/*
 http://code.compartmental.net/minim/
 https://soundeffect-lab.info/
 http://rina.jpn.ph/~rance/directx7/directx7study/ddraw/p151.html
 */
