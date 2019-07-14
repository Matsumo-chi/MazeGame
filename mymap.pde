// マップ元データ
/*
 0=道
 1=壁横
 2=壁縦
 3=柵
 4=縦柵
 5=横柵
 15=ブロック
 16=鍵ドア
 20=草1
 20=草2
 22=階段
 23=ポイント
 24=鍵
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