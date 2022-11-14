//ネクスト
class Next extends Mino {
  int x=840;
  int y=60;
  void setcolor(int array[][], int h) {
    for (int i=h*5; i<(h+1)*5; i++) {
      for (int j=0; j<array[i].length; j++) {
        if (array[i][j]==1) {
          if (block==0) {
            image(mizuiroImage, j*(side*3)/5+(x), i*(side*3)/5+(y), side*3/5, side*3/5);
          } else
            if (block==1) {
              image(kiImage, j*(side*3)/5+(x), i*(side*3)/5+(y), side*3/5, side*3/5);
            } else
              if (block==2) {
                image(murasakiImage, j*(side*3)/5+(x), i*(side*3)/5+(y), side*3/5, side*3/5);
              } else
                if (block==3) {
                  image(midoriImage, j*(side*3)/5+(x), i*(side*3)/5+(y), side*3/5, side*3/5);
                } else
                  if (block==4) {
                    image(akaImage, j*(side*3)/5+(x), i*(side*3)/5+(y), side*3/5, side*3/5);
                  } else
                    if (block==5) {
                      image(pinkuImage, j*(side*3)/5+(x), i*(side*3)/5+(y), side*3/5, side*3/5);
                    } else
                      if (block==6) {
                        image(aoImage, j*(side*3)/5+(x), i*(side*3)/5+(y), side*3/5, side*3/5);
                      }
        }
      }
    }
  }
  //次に出てくるミノを4つ表示させる　
  void next() {
    int nex[][]=new int[20][5];
    IntList junbanlist = new IntList();

    fill(255);
    for (int i=0; i<14; i++) {
      if (jun==true) {
        if (i<7) {
          junbanlist.append(jun1[i]);
        } else {
          junbanlist.append(jun2[i%7]);
        }
      } else {
        if (i<7) {
          junbanlist.append(jun2[i]);
        } else {
          junbanlist.append(jun1[i%7]);
        }
      }
    }
    if (jun==true) {
      fill(255);
      /*
      rect(790, (60), side*3, side*3);
      rect(790, side*3+(60), side*3, side*3);
      rect(790, side*6+(60), side*3, side*3);
      rect(790, side*9+(60), side*3, side*3);
      */
      next1.minono(junbanlist.get(jn1), 2, 2, nex);
      next2.minono(junbanlist.get(jn1+1), 2, 7, nex);
      next3.minono(junbanlist.get(jn1+2), 2, 12, nex);
      next4.minono(junbanlist.get(jn1+3), 2, 17, nex);
    } else {
      fill(255);
      /*
      rect(790, (60), side*3, side*3);
      rect(790, side*3+(60), side*3, side*3);
      rect(790, side*6+(60), side*3, side*3);
      rect(790, side*9+(60), side*3, side*3);
      */
      next1.minono(junbanlist.get(jn2), 2, 2, nex);
      next2.minono(junbanlist.get(jn2+1), 2, 7, nex);
      next3.minono(junbanlist.get(jn2+2), 2, 12, nex);
      next4.minono(junbanlist.get(jn2+3), 2, 17, nex);
    }
    next1.setcolor(nex, 0);
    next2.setcolor(nex, 1);
    next3.setcolor(nex, 2);
    next4.setcolor(nex, 3);
  }
}
