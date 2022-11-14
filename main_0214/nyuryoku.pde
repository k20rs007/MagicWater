//キーボード操作部分　Aで左、Dで右、Sで下、Wでハードドロップ、Rで回転、Fでホールド
void nyuryoku() {
  if (keyPressed) {
    if (key == 'a'&&current.hantei("l")) {
      current.left();
      x--;
    }
    if (key == 'd'&&current.hantei("r")) {
      current.right();
      x++;
    }
    if (key == 's' && current.hantei("d")) {
      current.down();
      y++;
    }
    if (key == 'w') {
      current.harddrop();
    }
    if (key == 'r') {
      current.spin();
    }
    if (key == 'q') {
      println("block:"+current.block);
    }
    if (key == 'f') {
      if (hold3==false) {
        if (hold2==false) {
          holds.block=current.block;
          current.erase(base);
          holds.hold();
          current.drop=false;
          hold2=true;
          hold3=true;
        } else {
          int fff;
          current.erase(base);
          fff=current.block;
          current.block=holds.block;
          x = 5;
          y = 1;
          current.minono(current.block,x,y,base);
          holds.block=fff;
          holds.hold();
          hold3=true;
        }
      }
    }
    keyPressed=false;
  }
}
