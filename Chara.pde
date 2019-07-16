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
    image(mapChip, x, y, w, h);
  }

  void move(String direction) {
    if (keyPressed) {
      // 方向
      if (direction == "up") {
        if (gseq == 1 || gseq == 11) {
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
                gseq = 2;
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
        if (gseq == 3) {//おかしい
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
                gseq = 4;
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
        if (gseq == 1 || gseq == 11) {
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
                  gseq = 2;
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
        if (gseq == 3) {//おかしい
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
                  gseq = 4;
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
        if (gseq == 1 || gseq == 11) {
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
                gseq = 2;
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
        if (gseq == 3) {
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
                gseq = 3;
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
      if (direction == "right") {//ok
        if (gseq == 1 || gseq == 11) {
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
                gseq = 2;
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
      }
      if (gseq == 3) {
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
              gseq = 4;
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
