void hp() {
  image(hpbackImage, 932, 90);
  if (hp < 1) {
    println("GAME CLEAR");
    scene = 5;
  }
  println(hp);
  changehp(hp, 960, 105, bhp*0.8, bhp*0.9);
  changehp(hp, 1010, 105, bhp*0.6, bhp*0.7);
  changehp(hp, 1060, 105, bhp*0.4, bhp*0.5);
  changehp(hp, 1110, 105, bhp*0.2, bhp*0.3);
  changehp(hp, 1160, 105, 0, bhp*0.1);
}

void changehp(float h1, int x, int y, float a1, float a2) {
  if (h1 <= a1) {
    image(hp16Image, x, y); //割れる
  } else if (h1 <= a2) {
    image(hp6Image, x, y); //水
  } else {
    image(hp1Image, x, y); //氷
  }
}
