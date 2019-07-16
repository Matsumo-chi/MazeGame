// Processingによるscanfもどき
// 2016/1/11 modified: 2/14
// matsuda
import java.awt.*;
import javax.swing.*;

JPanel _panel = new JPanel();
BoxLayout _layout = new BoxLayout(_panel, BoxLayout.Y_AXIS);
JTextField _text = new JTextField();

// 読み込んだデータを文字列として返す
String readString(String title, Boolean hideWindow){
  if (hideWindow) surface.setVisible(false);// Processingのウィンドウを非表示に
  _panel.setLayout(_layout);
  _panel.add(_text);
  
  JOptionPane.showMessageDialog(null, _panel, title, JOptionPane.QUESTION_MESSAGE);
  String s = _text.getText(); // テキストフィールドからデータを取り出す
  _text.setText(""); // テキストフィールドを空にする
  return s;
}

String readString(Boolean hideWindow){
  return readString("入力して下さい", hideWindow);
}

String readString(String title) {
  return readString(title, false);
}

String readString() {
  return readString(false);
}

// 読み込んだデータを整数として返す
int readInt(String title, Boolean hideWindow) {
  String s = readString(title, hideWindow);
  return int(s);
}

int readInt(Boolean hideWindow) {
  String s = readString("入力して下さい", hideWindow);
  return int(s);
}

int readInt(String title) {
  return readInt(title, false);
}

int readInt() {
  return readInt(false);
}

// 読み込んだデータを小数として返す
float readFloat(String title, Boolean hideWindow) {
  String s = readString(title, hideWindow);
  return float(s);
}

float readFloat(Boolean hideWindow) {
  String s = readString("入力して下さい", hideWindow);
  return float(s);
}

float readFloat(String title) {
  return readFloat(title, false);
}

float readFloat() {
  return readFloat(false);
}

 /* JOptionPane.showConfirmDialog(
    null, // オーナーウィンドウ
    panel, // メッセージ
    "データ入力", // ウィンドウタイトル
    JOptionPane.OK_CANCEL_OPTION, // オプション（ボタンの種類）
    JOptionPane.QUESTION_MESSAGE);  // メッセージタイプ（アイコンの種類）
    */
    
