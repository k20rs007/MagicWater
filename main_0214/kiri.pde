Kiri k1 = new Kiri();
Kiri k2 = new Kiri();
Kiri k3 = new Kiri();
Kiri k4 = new Kiri();
Kiri k5 = new Kiri();
Kiri k6 = new Kiri();
Kiri k7 = new Kiri();
Kiri k8 = new Kiri();
Kiri k9 = new Kiri();
Kiri k10 = new Kiri();
Kiri k11 = new Kiri();
Kiri k12 = new Kiri();
Kiri k13 = new Kiri();
Kiri k14 = new Kiri();
Kiri k15 = new Kiri();
Kiri k16 = new Kiri();
Kiri k17 = new Kiri();
Kiri k18 = new Kiri();
Kiri k19 = new Kiri();
Kiri k20 = new Kiri();
Kiri k21 = new Kiri();
Kiri k22 = new Kiri();
int kirisyoukyo=0;


void kirisetup() {
  kiri190=loadImage("kiri190.png");
  kiri190.resize(300, 212);
  kiri195=loadImage("kiri195.png");
  kiri195.resize(300, 212);
  kiri1100=loadImage("kiri1100.png");
  kiri1100.resize(300, 212);
  kiri290=loadImage("kiri290.png");
  kiri290.resize(300, 212);
  kiri295=loadImage("kiri295.png");
  kiri295.resize(300, 212);
  kiri2100=loadImage("kiri2100.png");
  kiri2100.resize(300, 212);

  kirifuda1=loadImage("kiri1100.png");
  kirifuda1.resize(170, 150);
  kirifuda2=loadImage("kiri2100.png");
  kirifuda2.resize(170, 150);
  kirifuda3=loadImage("kiri1100.png");
  kirifuda3.resize(170, 150);
  kirifuda4=loadImage("kiri2100.png");
  kirifuda4.resize(170, 150);

  k1.setKiri(0, 0, 350, 370, 60, 600);
  k2.setKiri(0, 0, 350, 370, 60, 600);
  k3.setKiri(0, 0, 350, 370, 60, 600);
  k4.setKiri(0, 0, 350, 370, 60, 600);
  k5.setKiri(0, 0, 350, 370, 60, 600);
  k6.setKiri(0, 0, 350, 370, 60, 600);
  k7.setKiri(0, 0, 350, 370, 60, 600);
  k8.setKiri(0, 0, 350, 370, 60, 600);
  k9.setKiri(0, 0, 350, 370, 60, 600);
  k10.setKiri(0, 0, 350, 370, 60, 600);
  k11.setKiri(0, 0, 350, 370, 60, 600);
  k12.setKiri(0, 0, 350, 370, 60, 600);
  k13.setKiri(0, 0, 350, 370, 60, 600);
  k14.setKiri(0, 0, 350, 370, 60, 600);
  k15.setKiri(0, 0, 350, 370, 60, 600);
  k16.setKiri(0, 0, 350, 370, 60, 600);
  k17.setKiri(0, 0, 350, 370, 60, 600);
  k18.setKiri(0, 0, 350, 370, 60, 600);
  k19.setKiri(0, 0, 760, 30, 30, 0); //kirifuda
  k20.setKiri(0, 0, 760, 30, 90, 70); //kirifuda
  k21.setKiri(0, 0, 760, 30, 190, 40); //kirifuda
  k22.setKiri(0, 0, 760, 30, 270, 60); //kirifuda
}

void kiriDraw() {
  if (gameCount>300&&kirisyoukyo<1) {
    k1.printKiri(kiri190, 490, 248);
  }
  if (gameCount>900&&kirisyoukyo<2) {
    k2.printKiri(kiri290, 490, 248);
  }
  if (gameCount>1500&&kirisyoukyo<3) {
    k3.printKiri(kiri195, 490, 248);
  }
  if (gameCount>2100&&kirisyoukyo<4) {
    k4.printKiri(kiri295, 490, 248);
  }
  if (gameCount>2700&&kirisyoukyo<5) {
    k5.printKiri(kiri1100, 490, 248);
  }
  if (gameCount>3300&&kirisyoukyo<6) {
    k6.printKiri(kiri2100, 490, 248);
  }
  if (gameCount>3900&&kirisyoukyo<7) {
    k7.printKiri(kiri190, 490, 248);
  }
  if (gameCount>4500&&kirisyoukyo<8) {
    k8.printKiri(kiri290, 490, 248);
  }
  if (gameCount>5100&&kirisyoukyo<9) {
    k9.printKiri(kiri195, 490, 248);
  }
  if (gameCount>5700&&kirisyoukyo<10) {
    k10.printKiri(kiri295, 490, 248);
  }
  if (gameCount>6300&&kirisyoukyo<11) {
    k11.printKiri(kiri1100, 490, 248);
  }
  if (gameCount>6900&&kirisyoukyo<12) {
    k12.printKiri(kiri2100, 490, 248);
  }
  if (gameCount>7500&&kirisyoukyo<13) {
    k13.printKiri(kiri190, 490, 248);
  }
  if (gameCount>8100&&kirisyoukyo<14) {
    k14.printKiri(kiri290, 490, 248);
  }
  if (gameCount>8700&&kirisyoukyo<15) {
    k15.printKiri(kiri195, 490, 248);
  }
  if (gameCount>9300&&kirisyoukyo<16) {
    k16.printKiri(kiri295, 490, 248);
  }
  if (gameCount>9900&&kirisyoukyo<17) {
    k17.printKiri(kiri1100, 490, 248);
  }
  if (gameCount>10500&&kirisyoukyo<18) {
    k18.printKiri(kiri2100, 490, 248);
  }

  if (hp<=bhp*0.2) {
    k19.kirifuda(kirifuda1, 0, 0);
    k20.kirifuda(kirifuda2, 0, 0);
    k21.kirifuda(kirifuda3, 0, 0);
    k22.kirifuda(kirifuda4, 0, 0);
  }
}

class Kiri {
  float kirix, kiriy;
  float minW, maxW, minH, maxH;
  float xnoise = random(2);
  float ynoise = random(2);
  float addNoise = 0.003;

  void setKiri(float kirix, float kiriy, float minW, float maxW, float minH, float maxH) {
    this.kirix = kirix; 
    this.kiriy = kiriy;
    this.minW = minW;
    this.maxW = maxW;
    this.minH = minH;
    this.maxH = maxH;
  }

  void printKiri(PImage image, float kirix, float kiriy) {
    kirix = noise(xnoise) * maxW + minW;
    kiriy = noise(ynoise) * maxH + minH;
    image(image, kirix, kiriy);
    xnoise += addNoise;
    ynoise += addNoise;
    //println("kirix:"+kirix+", "+"kiriy:"+kiriy);
  }

  void kirifuda(PImage image, float kirix, float kiriy) {
    kirix = noise(xnoise) * maxW + minW;
    kiriy = noise(ynoise) * maxH + minH;
    image(image, kirix, kiriy);
    xnoise += 0.005;
    ynoise += 0.005;
  }
}
