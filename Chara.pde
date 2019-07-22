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
    number = 30;//チップのキャラ番号
    image(mapChip, x, y, w, h);
    /*
    number++; 
     // ループ処理
     if (number == 33) {
     number = 30;
     }
     */
  }

  void update() {
    x = 64;
    y = 64;
  }

  void move(String direction) {
    if (direction == "up") {
      if (gsec == 1 ) {
        for (int i = 0; i < tiles1.length; i++) {
          if ((chara.x == tiles1[i].x) && (chara.y == tiles1[i].y)) {
            if (tiles1[i-10].v == 0 || tiles1[i-10].v == 20) {
              chara.y = chara.y - s;
              break;
            } else if (tiles1[i-10].v == 16) {//鍵ドア
              if (Key == true) {
                chara.y = chara.y - s;
                unlock.trigger();
              }
              break;
            } else if (tiles1[i-10].v == 22) {//階段次のステージへ
              chara.y = chara.y - s;
              unlock.trigger();
              gsec = 2;
              reset();
              break;
            } else if (tiles1[i-10].v == 23) {//ポイント
              chara.y = chara.y - s;
              get.trigger();
              point = 1;
              break;
            } else if (tiles1[i-10].v == 24) {//鍵
              chara.y = chara.y - s;
              Key = true;
              if (Key == true) {
                get1.trigger();
              }
              break;
            }
          }
        }
      }
      if (gsec == 3 ) {
        for (int i = 0; i < tiles2.length; i++) {
          if ((chara.x == tiles2[i].x) && (chara.y == tiles2[i].y)) {
            if (tiles2[i-10].v == 0 || tiles2[i-10].v == 20) {
              chara.y = chara.y - s;
              break;
            } else if (tiles2[i-10].v == 16) {//鍵ドア
              if (Key == true) {
                chara.y = chara.y - s;
                unlock.trigger();
              }
              break;
            } else if (tiles2[i-10].v == 22) {//階段次のステージへ
              chara.y = chara.y - s;
              unlock.trigger();
              gsec = 4;
              reset();
              break;
            } else if (tiles2[i-10].v == 23) {//ポイント
              chara.y = chara.y - s;
              get.trigger();
              point = 1;
              break;
            } else if (tiles2[i-10].v == 24) {//鍵
              chara.y = chara.y - s;
              Key = true;
              if (Key == true) {
                get1.trigger();
              }
              break;
            }
          }
        }
      }
    }
    if (direction == "down") {
      if (gsec == 1 ) {
        for (int i = 0; i < tiles1.length; i++) {
          if ((chara.x == tiles1[i].x) && (chara.y == tiles1[i].y)) {
            if (tiles1[i + 10].v == 0 || tiles1[i+10].v == 20) {
              chara.y = chara.y + s;
              break;
            } else if (tiles1[i+10].v == 16) {
              if (Key == true) {
                chara.y = chara.y + s;
                unlock.trigger();
              }
              break;
            } else if (tiles1[i+10].v == 22) {
              if (Key == true) {
                chara.y = chara.y + s;
                unlock.trigger();
                gsec = 2;
                reset();
              }
              break;
            } else if (tiles1[i+10].v == 23) {
              chara.y = chara.y + s;
              get.trigger();
              point = 1;
              break;
            } else if (tiles1[i+10].v == 24) {
              chara.y = chara.y + s;
              Key = true;
              if (Key == true) {
                get1.trigger();
              }
              break;
            }
          }
        }
      }
      if (gsec == 3 ) {
        for (int i = 0; i < tiles2.length; i++) {
          if ((chara.x == tiles2[i].x) && (chara.y == tiles2[i].y)) {
            if (tiles2[i + 10].v == 0 || tiles2[i+10].v == 20) {
              chara.y = chara.y + s;
              break;
            } else if (tiles2[i+10].v == 16) {
              if (Key == true) {
                chara.y = chara.y + s;
                unlock.trigger();
              }
              break;
            } else if (tiles2[i+10].v == 22) {
              if (Key == true) {
                chara.y = chara.y + s;
                unlock.trigger();
                gsec = 4;
                reset();
              }
              break;
            } else if (tiles2[i+10].v == 23) {
              chara.y = chara.y + s;
              get.trigger();
              point = 1;
              break;
            } else if (tiles2[i+10].v == 24) {
              chara.y = chara.y + s;
              Key = true;
              if (Key == true) {
                get1.trigger();
              }
              break;
            }
          }
        }
      }
    }
    if (direction == "left") {
      if (gsec == 1 ) {
        for (int i = 0; i < tiles1.length; i++) {
          if ((chara.x == tiles1[i].x) && (chara.y == tiles1[i].y)) {
            if (tiles1[i-1].v == 0 || tiles1[i-1].v == 20) {
              chara.x = chara.x - s;
              break;
            } else if (tiles1[i-1].v == 16) {
              if (Key == true) {
                chara.x = chara.y - s;
                unlock.trigger();
              }
              break;
            } else if (tiles1[i-1].v == 22) {
              chara.x = chara.y - s;
              unlock.trigger();
              gsec = 2;
              reset();
              break;
            } else if (tiles1[i-1].v == 23) {
              chara.x = chara.x - s;
              get.trigger();
              point = 1;
              break;
            } else if (tiles1[i-1].v == 24) {
              chara.x = chara.y - s;
              Key = true;
              if (Key == true) {
                get1.trigger();
              }
              break;
            }
          }
        }
      }
      if (gsec == 3 ) {
        for (int i = 0; i < tiles2.length; i++) {
          if ((chara.x == tiles2[i].x) && (chara.y == tiles2[i].y)) {
            if (tiles2[i-1].v == 0 || tiles2[i-1].v == 20) {
              chara.x = chara.x - s;
              break;
            } else if (tiles2[i-1].v == 16) {
              if (Key == true) {
                chara.x = chara.y - s;
                unlock.trigger();
              }
              break;
            } else if (tiles2[i-1].v == 22) {
              chara.x = chara.y - s;
              unlock.trigger();
              gsec = 4;
              reset();
              break;
            } else if (tiles2[i-1].v == 23) {
              chara.x = chara.x - s;
              get.trigger();
              point = 1;
              break;
            } else if (tiles2[i-1].v == 24) {
              chara.x = chara.y - s;
              Key = true;
              if (Key == true) {
                get1.trigger();
              }
              break;
            }
          }
        }
      }
    }
    if (direction == "right") {
      if (gsec == 1 ) {
        for (int i = 0; i < tiles1.length; i++) {
          if ((chara.x == tiles1[i].x) && (chara.y == tiles1[i].y)) {
            if (tiles1[i+1].v == 0 || tiles1[i+1].v == 20) {
              chara.x = chara.x + s;
              break;
            } else if (tiles1[i+1].v == 16) {
              if (Key == true) {
                chara.x = chara.y + s;
                unlock.trigger();
              }
              break;
            } else if (tiles1[i+1].v == 22) {
              chara.x = chara.y + s;
              unlock.trigger();
              gsec = 2;
              reset();
              break;
            } else if (tiles1[i+1].v == 23) {
              chara.x = chara.x + s;
              get.trigger();
              point = 1;
              break;
            } else if (tiles1[i+1].v == 24) {
              chara.x = chara.x + s;
              Key = true;
              if (Key == true) {
                get1.trigger();
              }
              break;
            }
          }
        }
      }
      if (gsec == 3 ) {
        for (int i = 0; i < tiles2.length; i++) {
          if ((chara.x == tiles2[i].x) && (chara.y == tiles2[i].y)) {
            if (tiles2[i+1].v == 0 || tiles2[i+1].v == 20) {
              chara.x = chara.x + s;
              break;
            } else if (tiles2[i+1].v == 16) {
              if (Key == true) {
                chara.x = chara.y + s;
                unlock.trigger();
              }
              break;
            } else if (tiles2[i+1].v == 22) {
              chara.x = chara.y + s;
              unlock.trigger();
              gsec = 4;
              reset();
              break;
            } else if (tiles2[i+1].v == 23) {
              chara.x = chara.x + s;
              get.trigger();
              point = 1;
              break;
            } else if (tiles2[i+1].v == 24) {
              chara.x = chara.x + s;
              Key = true;
              if (Key == true) {
                get1.trigger();
              }
              break;
            }
          }
        }
      }
    }
  }
}

class Bubble {
  PVector loc;
  float   speed;
  float   radius;

  Bubble() {
    loc = new PVector( random(width), random(height) );
    speed = random(0.5, 2);
    radius = random( 5, 10 );
  }

  void update() {
    loc.y -= speed;
  }

  void render() {
    stroke(#D7EAF2);
    fill(59, 173, 224, 64);
    ellipse( loc.x, loc.y, radius * 2, radius * 2 );
  }

  void reset() {
    loc.x = random(width);
    loc.y = height + 50;
    speed = random(0.5, 2);
    radius = random( 5, 10 );
  }
}
