void time() {
  float mss = millis()/1000 - starttm ; //時間
  boolean ret = musictime.isPlaying();
  image(timehaikeiImage, 12, 50);
  println("mss"+ mss);
  if (mss > 180) {
    println("GAME OVER");
    scene = 3;
  }
  if(ret == true) {
    c++;
  } else if (mss % 30 != 0) {
    c = 0;
  }
  println("c:"+c);
    changetime(mss, 35, 60, 30,c);
    changetime(mss, 95, 60, 60,c);
    changetime(mss, 155, 60, 90,c);
    changetime(mss, 35, 110, 120,c);
    changetime(mss, 95, 110, 150,c);
    changetime(mss, 155, 110, 180,c);
  }


void changetime(float m, int x, int y, float t,int c) {
  if(m == t && c == 0) {
    musictime.setGain(30);
    musictime.play(0);
  }
  if (m >= t) {
    image(time2Image, x, y);
  } else {
    image(timeImage, x, y);
  }
}
