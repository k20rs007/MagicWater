PImage holdImage;
public class Hold extends Mino {
  int block;
  int x=350;//画面左端からの距離
  int y=70;//画面上からの距離
  //ミノの描画
  void setcolor(int array[][]) {
    for (int i=0; i<array.length; i++) {
      for (int j=0; j<array[i].length; j++) {
        if (array[i][j]==1) {
          if (holds.block==0) {
            image(mizuiroImage, j*side*3/5+(x), i*side*3/5+(y), side*3/5, side*3/5);
          } else
            if (holds.block==1) {
              image(kiImage, j*side*3/5+(x), i*side*3/5+(y), side*3/5, side*3/5);
            } else
              if (holds.block==2) {
                image(murasakiImage, j*side*3/5+(x), i*side*3/5+(y), side*3/5, side*3/5);
              } else
                if (holds.block==3) {
                  image(midoriImage, j*side*3/5+(x), i*side*3/5+(y), side*3/5, side*3/5);
                } else
                  if (holds.block==4) {
                    image(akaImage, j*side*3/5+(x), i*side*3/5+(y), side*3/5, side*3/5);
                  } else
                    if (holds.block==5) {
                      image(pinkuImage, j*side*3/5+(x), i*side*3/5+(y), side*3/5, side*3/5);
                    } else
                      if (holds.block==6) {
                        image(aoImage, j*side*3/5+(x), i*side*3/5+(y), side*3/5, side*3/5);
                      }
        }
      }
    }
  }
  //ホールドの処理
  void hold() {    
    fill(255);
    //rect(x, y, side*3, side*3);
    int hol[][]=new int[5][5];
    if (hold2==true) {
      holds.minono(holds.block, 2, 2, hol);
    }
    draw();
    holds.setcolor(hol);
  }
  void draw() {
    holdImage=loadImage("pazuruback.png");
    image(holdImage, 340, 10);
    stroke(128);
    for(int i=0;i<9;i++){
      line(i*side+520,60,i*side+520,660);
    }
    for(int i=0;i<19;i++){
      line(490,i*side+90,790,i*side+90);
    }

  }
}
