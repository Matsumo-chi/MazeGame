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
              get.trigger();
              point = 1;
              break;
            } else if (tiles[i-10].v == 24) {
              chara.y = chara.y - s;
              Key = true;
              if (Key == true) {
                get1.trigger();
              }
              break;
            } else if (tiles[i-10].v == 16) {
              if (Key == true) {
                chara.y = chara.y - s;
                unlock.trigger();
              }
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
              get.trigger();
              point = 1;
              break;
            } else if (tiles[i+10].v == 24) {
              chara.y = chara.y + s;
              Key = true;
              if (Key == true) {
                get1.trigger();
              }
              break;
            } else if (tiles[i+10].v == 16) {
              if (Key == true) {
              chara.y = chara.y + s;
              unlock.trigger();
              }
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
            } else if (tiles[i-1].v == 23) {
              chara.x = chara.x - s;
              get.trigger();
              point = 1;
              break;
            } else if (tiles[i-1].v == 24) {
              chara.x = chara.y - s;
              Key = true;
              if (Key == true) {
                get1.trigger();
              }
              break;
            } else if (tiles[i-1].v == 16) {
              if (Key == true) {
              chara.x = chara.y - s;
              unlock.trigger();
              }
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
            } else if (tiles[i+1].v == 23) {
              chara.x = chara.x + s;
              get.trigger();
              point = 1;
              break;
            } else if (tiles[i+1].v == 24) {
              chara.x = chara.x + s;
              Key = true;
              if (Key == true) {
                get1.trigger();
              }
              break;
            } else if (tiles[i+1].v == 16) {
              if (Key == true) {
              chara.x = chara.y + s;
              unlock.trigger();
              }
              break;
            }
          }
        }
      }
    }
  }
}
