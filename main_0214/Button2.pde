class Button2 {
  int x, y;
  int bx, by;
  int state;

  boolean mouseClicked;

  String str;

  Button2(int x, int y, int bx, int by, String str) {
    this.x = x;
    this.y = y;
    this.bx = bx;
    this.by = by;
    this.str = str;
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

Button2 s1 = new Button2(650, 150, 700, 200, "LAKE");
Button2 s2 = new Button2(350, 350, 400, 400, "FOREST");
Button2 s3 = new Button2(1030, 470, 1080, 520, "LIGHTHOUSE");
Button2 chrc = new Button2(50, 600, 160, 700, "Character");



void stage1() {
  image(b21, s1.x, s1.y);
  //text(s1.str, s1.x + 70, s1.y + 30);
  if (s1.checkInMouse() == true) {
    image(b22, s1.x, s1.y);
    image(hukidashi1, s1.x, s1.y - 100);
    fill(0);
  }
  if (s1.checkState() == 2) {
    scene = 1;
    enemyImage=loadImage("game_setumeitekikai1.png");
    enemyImage.resize(enemyImage.width/3, enemyImage.height/3);
    enemyImage1=loadImage("game_setumeitekikai1.png");
    enemyImage1.resize(enemyImage1.width/3, enemyImage1.height/3);
    enemyImage2=loadImage("game_setumeitekikai2.png");
    enemyImage2.resize(enemyImage2.width/3, enemyImage2.height/3);
    enemyImage3=loadImage("game_setumeitekikai3.png");
    enemyImage3.resize(enemyImage3.width/3, enemyImage3.height/3);
    
    c1.setCharactermove(100, 240, 80, 50, 200, 150);
    c2.setCharactermove(950, 240, 880, 50, 180, 150);
    int my = -30;
    int mx = -30;
    c2.setCharactermove(950+mx, 240 + my, 880+mx, 50+mx, 180+ my, 150+ my);
    
    
    gameSetup();
    
  }
}

void stage2() {
  //text(s1.str, s1.x + 70, s1.y + 30);
  if (level >= 1) {
    image(b21, s2.x, s2.y);
    if (s2.checkInMouse() == true) {
      image(b22, s2.x, s2.y);
      image(hukidashi2, s2.x, s2.y - 100);
      fill(0);
    }
    if (s2.checkState() == 2) {
      scene = 1;
    
      enemyImage=loadImage("lilly.png");
      enemyImage.resize(enemyImage.width/3, enemyImage.height/3);
      enemyImage1=loadImage("lilly.png");
      enemyImage1.resize(enemyImage1.width/3, enemyImage1.height/3);
      enemyImage2=loadImage("lilly2.png");
      enemyImage2.resize(enemyImage2.width/3, enemyImage2.height/3);
      enemyImage3=loadImage("lilly3.png");
      enemyImage3.resize(enemyImage3.width/3, enemyImage3.height/3);
      
      c1.setCharactermove(100, 240, 80, 50, 200, 150);
      int my = -30;
      c2.setCharactermove(950, 240 + my, 880, 50, 180+ my, 150+ my);

      
      
      gameSetup();
      set1();
    }
  } else {
    image(b23, s2.x, s2.y);
  }
}

void stage3() {
  //text(s1.str, s1.x + 70, s1.y + 30);
  if (level >= 2) {
    image(b21, s3.x, s3.y);
    if (s3.checkInMouse() == true) {
      image(b22, s3.x, s3.y);
      image(hukidashi3, s3.x - 200, s3.y - 100);
      fill(0);
    }
    if (s3.checkState() == 2) {
      scene = 1;
      enemyImage=loadImage("ema.png");
      enemyImage.resize(enemyImage.width/3 + 50, enemyImage.height/3 + 50);
      enemyImage1=loadImage("ema.png");
      enemyImage1.resize(enemyImage1.width/3 + 50, enemyImage1.height/3 + 50);
      enemyImage2=loadImage("ema2.png");
      enemyImage2.resize(enemyImage2.width/3 + 50, enemyImage2.height/3 + 50);
      enemyImage3=loadImage("ema3.png");
      enemyImage3.resize(enemyImage3.width/3 + 50, enemyImage3.height/3 + 50);
      c1.setCharactermove(100, 240, 80, 50, 200, 150);
      c2.setCharactermove(950, 240, 880, 50, 180, 150);

      
      gameSetup();
      set2();
    }
  } else {
    image(b23, s3.x, s3.y);
  }
}

void selChr() {
  image(chr, chrc.x, chrc.y);
  if (chrc.checkState() == 2) {
    scene = 7;
  }
}
