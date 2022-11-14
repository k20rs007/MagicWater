class Button {
  int x, y;
  int bx, by;
  int state;

  boolean mouseClicked;

  String str;

  PImage img;

  Button(int x, int y, int bx, int by, PImage img,String str) {
    this.x = x;
    this.y = y;
    this.bx = bx;
    this.by = by;
    this.str = str;
    this.img = img;
  }

  boolean isPush() {
    if (checkState()==2) return true;
    return false;
  }

  int checkState() {
    if (!checkInMouse()) {
      return 0;
    }
    if (!mousePressed) {
      return 1;
    }
    return 2;
  }

  boolean checkInMouse() {
    if (mouseX >= x && mouseY >= y ) {
      if ( mouseX <= bx && mouseY <= by) {
        return true;
      }
    }
    return false;
  }
}

String txtName[] = {
 "エミリー（シスター）\r\n世界を平和にするために戦っている。\r\n祈ることで魔法が発動する。",
 "サラ（呪術師）\r\n離ればなれになってしまった妹を探して戦っている。\r\n笛から出る音玉で敵を攻撃する。",
 "リリー（魔法使い）\r\n魔法師として依頼を受けて戦っている。\r\n炎で水を蒸発させる。", 
 "エマ（魔法剣士）\r\n強くなる修行をするために旅をしている。\r\n魔法より剣が得意。"
};

//Button bex = new Button(540, 400, 680, 470, "START");
Button b1 = new Button(450, 400, 850, 470, bn,"START");
Button b2 = new Button(1100, 600, 1240, 670, bn,"EXIT");
Button b3 = new Button(540, 400, 680, 470, bn,"STRAT");
Button b4 = new Button(540, 500, 680, 570, bn,"CONTINUE");
Button b5 = new Button(540, 600, 680, 670, bn,"to menu");
Button optn = new Button(50, 600, 160, 700, bn,"Option");
Button bk = new Button(1100, 100, 1210, 200, bn,"Back");



/*void buttonBase() {
 image(bt, bex.x, bex.y);
 if (b1.checkInMouse() == true) {
 image(bt, bex.x, bex.y);
 }
 if (bex.checkState() == 2) {
 scene = 1;
 }
 }*/

//To map
void startButton() {
  image(start, b1.x, b1.y);
  //text(b1.str, b1.x + 70, b1.y + 30);
  if (b1.checkInMouse() == true) {
    image(start2, b1.x, b1.y);
  }
  if (b1.checkState() == 2) {
    scene = 6;
  }
}

void exitButton() {
  image(back, b2.x, b2.y);
  if (b2.checkState() == 2) {
    exit();
  }
}

//キャラクター選択
void selectButton() {
  for (int i = 0; i <= level; i++) {
    if(person[i].str.equals("Emily")){
      image(person[i].img, person[i].x, person[i].y);      
    } else if(person[i].str.equals("Sara")){
      image(person[i].img, person[i].x-140, person[i].y-50);      
    } else if(person[i].str.equals("Lilly")){
      image(person[i].img, person[i].x-120, person[i].y-60);      
    } else if(person[i].str.equals("Ema")){
      image(person[i].img, person[i].x-100, person[i].y-30);      
    }
    

    if (person[i].checkInMouse() == true) {
      fill(255, 100);
      //rect(person[i].x, person[i].y, 300, 400);
      textAlign(CORNER);
      textSize(18);
      fill(0);
      if (i <= 2) {
        image(hukidashi, person[i].x, person[i].by);
        text(txtName[i], person[i].x + 5, person[i].by + 30);
//        text(txt[i], person[i].x + 5, person[i].by + 60);
      } else {
        image(hukidashi, person[i].x - 150, person[i].by);
        text(txtName[i], person[i].x - 145, person[i].by + 30);
//        text(txt[i], person[i].x - 145, person[i].by + 60);
      }
    }
    if (person[i].checkState() == 2) {
      //ownImage = person[i].img;
      //getDispImage = ownImage.get(50, 0, 180, 200);
      scene = 4;
    }
  }
}

void resumeButton() {
}


void continueButton() {
  textSize(20);
  image(bt, b4.x, b4.y);
  text(b4.str, b4.x + 70, b4.y + 40);
  if (b4.checkInMouse() == true) {
    image(bt, b4.x, b4.y);
  }
  if (b4.checkState() == 2) {
    scene = 1;
    musiclose.close();
    musiclose = minim.loadFile("lose.mp3");
    bgm = true;
    bgm2 = true;
    gameSetup();
  }
}

void menuButton() {
  textSize(20);
  image(bt, b5.x, b5.y);
  text(b5.str, b5.x + 70, b5.y + 40);
  if (b5.checkInMouse() == true) {
    image(bt, b5.x, b5.y);
  }
  if (b5.checkState() == 2) {
    scene = 4;
    musicwin.close();
    musicwin = minim.loadFile("win.mp3");
    musiclose.close();
    musiclose = minim.loadFile("lose.mp3");
    bgm = true;
    title = true;
    title2 = true;
    bgm2 = true;
    titlestart = true;
  }
}

void optButton() {
  image(opt, optn.x, optn.y);
  if (optn.checkState() == 2) {
    scene = 2;
  }
}

void dispCharacter() {
  fill(#fae19e);
  rect(20, 20, 180, 200);
  image(getDispImage, 20, 20);
}
