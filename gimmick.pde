void shoot() {
  fill(255);
  rect(getMouseX, 10*(getFrameCount-frameCount)+260, 5, 50);
  if (frameCount>getFrameCount+20) {
    clicked=false;
    if (scene==0) {
      for (int i=0; i<3; i++) {
        if (30+120*i<getMouseX&&getMouseX<130+120*i) {
          hit=i;
        }
      }
    } else if (scene<questions.length) {
      for (int i=0; i<4; i++) {
        if (20+100*i<getMouseX&&getMouseX<80+100*i) {
          hit=i;
          if (hit==answers[scene-1])playCorrectSound=true;
          else playIncorrectSound=true;
        }
      }
    } else {
      if (160<getMouseX&&getMouseX<240) {
        hit=0;
        shuffle();
        scores="";
      }
    }
  }
}

void sceneChange() {
  if (sceneChange&&frameCount>getFrameCount+50) {
    if (scene==questions.length)scene=0;
    else scene++;
    hit=-1;
    sceneChange=false;
  }
}
void shuffle() {
  for (int i=0; i<questions.length-1; i++) {//shuffle choices
    for (int j=0; j<5; j++) {
      int shuffle1 = (int)random(4);
      int shuffle2 = (shuffle1+(int)random(1, 4))%4;
      if (shuffle1==answers[i])answers[i]=shuffle2;
      else if (shuffle2==answers[i])answers[i]=shuffle1;
      String temp =questions[i][shuffle1];
      questions[i][shuffle1]=questions[i][shuffle2];
      questions[i][shuffle2]=temp;
    }
  }
}
