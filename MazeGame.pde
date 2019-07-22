import ddf.minim.*;//サウンドAPI　ミニム //<>//
Minim minim;
AudioPlayer player;
AudioSample mizu;
AudioSample get;
AudioSample get1;
AudioSample unlock;

PFont font; //フォント
int gsec;//ゲームの流れ
int mcnt;//メッセージ用カウンター
int numBubbles = 50;
int number;
int point = 0;
boolean Key = false;
final int Chip_w = 64;//チップサイズ
final int Chip_h = 64;
Bubble[] bubbles;
Chara chara;
Tile1[] tiles1 =  new Tile1[0];
Tile2[] tiles2 =  new Tile2[0];
MapChip mp1;

void setup() {
  svr = new Server(this, 5555); // サーバを立ち上げる
  size(960, 640);
  gameInit();
  font = loadFont("NuAnkoMochi-Square-1-48.vlw"); 
  textFont(font, 32);
  mp1=new MapChip("mapchip.png");//マップチップの読み込み
  number = 1;

  bubbles = new Bubble[numBubbles];
  for (int i = 0; i < numBubbles; i++) {
    bubbles[i] = new Bubble();
  }

  minim = new Minim(this);//サウンドの読み込み
  player = minim.loadFile("bath1.mp3");  
  player.play();  //再生
  mizu = minim.loadSample("water-drop3.mp3", 2048);
  get = minim.loadSample("touch1.mp3", 2048);
  get1 = minim.loadSample("decision1.mp3", 2048);
  unlock = minim.loadSample("decision22.mp3", 2048);
}

void draw() {
  smooth();
  if (gsec == 0) {//ゲームタイトル
    gameTitle();
  } else if (gsec == 1) {//ステージ１
    gamePlay1();
  } else if (gsec == 2) {//ステージクリア
    stageclear();
  } else if (gsec == 3) {//ステージ2
    gamePlay2();
  } else if (gsec == 4) {//ステージクリア
    stageclear();
  } else if (gsec == 111) {//デバックモード
    debug();
  } else {
    gameOver();
  }
}
void gameInit() {
  gsec = 0;
}

void gameTitle() {
  PImage title = loadImage("title.png");
  image(title, 0, 0);

  noStroke();
  fill(#D7EAF2);
  rect( 286, 425, 162, 40);
  rect( 512, 425, 162, 40);
  fill(#0377BF);
  textSize(30);
  text("play", 330, 450);
  text("debug", 540, 450);

  for (int i = 0; i < bubbles.length; i++) {
    bubbles[i].update();
    bubbles[i].render();
    if ( bubbles[i].loc.y < -50) {
      bubbles[i].reset();
    }
  }
}

void gamePlay1() {//ステージ1
  fill(#038ABF);
  noStroke();
  rect(0, 0, 650, 650);
  Get(); 
  fill(#D7EAF2);
  rect( 780, 580, 162, 40);
  text("stage1", 700, 30);
  commentGet();
  fill(#0377BF);
  textSize(30);
  text("exit", 820, 610);
  for (int i = 0; i < tiles1.length; i++) {  // グリッドを並べる
    tiles1[i].display();
  }
  chara.display();   //chara表示
}

void gamePlay2() {//ステージ2
  fill(#038ABF);
  noStroke();
  rect(0, 0, 650, 650);
  fill(#D7EAF2);
  rect( 780, 580, 162, 40);
  text("stage2", 700, 30);
  fill(#0377BF);
  textSize(30);
  text("exit", 820, 610);
  commentGet();
  Get(); 
  for (int i = 0; i < tiles2.length; i++) {
    tiles2[i].display();
  }
  chara.display();
  println(point);
  println(Key);
}

void stageclear() {
  background(#038ABF);
  fill(255);
  textSize(100);
  text("clear!!", width/2-210, 200);
  textSize(30);
  mcnt++;
  if ((mcnt > 60)&&((mcnt%60) < 40)) {
    fill(255);
    text("Push any key!", width/2-120, height/2+100);
  }

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
  noStroke();
  fill(#D7EAF2);
  rect( 780, 580, 162, 40);
  fill(#0377BF);
  textSize(30);
  text("exit", 820, 610);
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

void stage2_start() {
  background(#038ABF);
  // 10*10のグリッドを作る
  for (int i = 0; i <= 9; i++) {
    for (int j = 0; j <= 9; j++) {
      Tile2 a = new Tile2(j*Chip_w, i*Chip_h, Chip_w, Chip_h, mymap2[i][j]);
      tiles2 = (Tile2[]) append(tiles2, a);//配列の末尾に追加  append(配列名, 要素);
    }
  }
  chara = new Chara(64*1, 64*1, 64, 64, 64);
}

void mouseClicked() {
  if (gsec == 0) {
    if ( mouseButton == LEFT ) {
      if (286 <= mouseX && mouseX <= 488) {
        if (425 <= mouseY && mouseY <= 465) {
          stage1_start();
          gsec = 1;
        }
      }
    }
    if ( mouseButton == LEFT ) {
      if (512 <= mouseX && mouseX <= 674) {
        if (425 <= mouseY && mouseY <= 465) {
          background(#038ABF);
          gsec = 111;
        }
      }
    }
  }

  if (gsec == 1) {
    if ( mouseButton == LEFT ) {
      if (780 <= mouseX && mouseX <= 942) {
        if (580 <= mouseY && mouseY <= 620) {
          gsec = 0;
        }
      }
    }
  }
  if (gsec == 3) {
    if ( mouseButton == LEFT ) {
      if (780 <= mouseX && mouseX <= 942) {
        if (580 <= mouseY && mouseY <= 620) {
          gsec = 0;
        }
      }
    }
  }
  if (gsec == 111) {
    if ( mouseButton == LEFT ) {
      if (780 <= mouseX && mouseX <= 942) {
        if (580 <= mouseY && mouseY <= 620) {
          gsec = 0;
        }
      }
    }
  }
}
void keyPressed() {
  mizu.trigger(); 
  if (gsec == 2) {
    fill(#038ABF);
    rect(640, 0, 960, 960);
    stage2_start();
    gsec = 3;
  } else if (gsec == 4) {
    fill(#038ABF);
    rect(640, 0, 960, 960);
    gsec = 0;
  }else if (keyCode == ENTER && gsec == 111) {
    gsec = 0;
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
