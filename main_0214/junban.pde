//ミノの出てくる順番を決める処理
boolean jun=false;
void junjun() {
  if (jn1==7) {
    IntList foo = new IntList();
    for (int i=0; i<jun1.length; i++) {
      foo.append(i);
    }
    foo.shuffle();
    jun1=foo.array();
    jn1=0;
    jun=false;
    //println("Switch to 2");
  }
  if (jn2==7) {
    IntList foo = new IntList();
    for (int i=0; i<jun2.length; i++) {
      foo.append(i);
    }
    foo.shuffle();
    jun2=foo.array();
    jn2=0;
    jun=true;
    //println("Switch to 1");
  }
}
