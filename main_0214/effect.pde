void effectsetup() {
  effect1=loadImage("effect1.png");
  effect1.resize(side, side);
  effect2=loadImage("effect2.png");
  effect2.resize(side, side);
  effect3=loadImage("effect3.png");
  effect3.resize(side, side);
  effect4=loadImage("effect4.png");
  effect4.resize(side, side);
  effect5=loadImage("effect5.png");
  effect5.resize(side, side);
}

float scoreE = 0;
int retu1 = -30, retu2 = -30, retu3 = -30, retu4 = -30;
int effectcount = 0;
int i = 0;
void effect() {
  if (retu1 >= 0 || retu2 >= 0 || retu3 >= 0 || retu4 >= 0) {
    if(effectcount == 0) {
      effectcount=20;
    }
  }
  println("retu1 = " + retu1);
  if (effectcount>0) {
    effectcount--;
    if (effectcount>16) {
      for (i = 0; i < 10; i++) {
        image(effect1, 490 + i*30, retu1*side+60);
      }
      if (retu2!=0) {
        for (i = 0; i < 10; i++) {
          image(effect1, 490 + i*30, retu2*side+60);
        }
      }

      if (retu3!=0) {
        for (i = 0; i < 10; i++) {
          image(effect1, 490 + i*30, retu3*side+60);
        }
      }

      if (retu4!=0) {
        for (i = 0; i < 10; i++) {
          image(effect1, 490 + i*30, retu4*side+60);
        }
      }
    } else if (effectcount>12) {

      for (i = 0; i < 10; i++) {
        image(effect2, 490 + i*30, retu1*side+60);
      }

      if (retu2!=0) {
        for (i = 0; i < 10; i++) {
          image(effect2, 490 + i*30, retu2*side+60);
        }
      }

      if (retu3!=0) {
        for (i = 0; i < 10; i++) {
          image(effect2, 490 + i*30, retu3*side+60);
        }
      }

      if (retu4!=0) {
        for (i = 0; i < 10; i++) {
          image(effect2, 490 + i*30, retu4*side+60);
        }
      }
    } else if (effectcount>8) {
      for (i = 0; i < 10; i++) {
        image(effect3, 490 + i*30, retu1*side+60);
      }

      if (retu2!=0) {
        for (i = 0; i < 10; i++) {
          image(effect3, 490 + i*30, retu2*side+60);
        }
      }

      if (retu3!=0) {
        for (i = 0; i < 10; i++) {
          image(effect3, 490 + i*30, retu3*side+60);
        }
      }

      if (retu4!=0) {
        for (i = 0; i < 10; i++) {
          image(effect3, 490 + i*30, retu4*side+60);
        }
      }
    } else if (effectcount>4) {
      for (i = 0; i < 10; i++) {
        image(effect4, 490 + i*30, retu1*side+60);
      }

      if (retu2!=0) {
        for (i = 0; i < 10; i++) {
          image(effect4, 490 + i*30, retu2*side+60);
        }
      }

      if (retu3!=0) {
        for (i = 0; i < 10; i++) {
          image(effect4, 490 + i*30, retu3*side+60);
        }
      }

      if (retu4!=0) {
        for (i = 0; i < 10; i++) {
          image(effect4, 490 + i*30, retu4*side+60);
        }
      }
    } else if (effectcount>0) {

      for (i = 0; i < 10; i++) {
        image(effect5, 490 + i*30, retu1*side+60);
      }

      if (retu2!=0) {
        for (i = 0; i < 10; i++) {
          image(effect5, 490 + i*30, retu2*side+60);
        }
      }

      if (retu3!=0) {
        for (i = 0; i < 10; i++) {
          image(effect5, 490 + i*30, retu3*side+60);
        }
      }

      if (retu4!=0) {
        for (i = 0; i < 10; i++) {
          image(effect5, 490 + i*30, retu4*side+60);
        }
      }

      retu1=-30;
      retu2=-30;
      retu3=-30;
      retu4=-30;
    }
  }
  scoreE = score;
}
