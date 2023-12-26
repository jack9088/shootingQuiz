import ddf.minim.*;
Minim minim;
AudioPlayer lazerSound, correctSound, incorrectSound;
int hit=-1; //judge hit monster
String enemy; //squid or octopus or crab
int getMouseX; //save mouseX when clicked
int getFrameCount;
int correct=0;
int scene = 0;//0:menu 1~:quiz
int px = 5; //pixel
boolean sceneChange=false;
boolean clicked = false;
boolean playCorrectSound = false;
boolean playIncorrectSound = false;
float[] starsPosX = new float[20];
float[] starsPosY = new float[20];
void setup() {
  size(400, 400);
  for (int i=0; i<starsPosX.length; i++) {
    starsPosX[i]=(float)random(5, 395);
    starsPosY[i]=(float)random(5, 300);
  }
  shuffle();
  minim = new Minim(this);
  lazerSound = minim.loadFile("lazer.mp3");
  correctSound = minim.loadFile("correct.mp3");
  incorrectSound = minim.loadFile("incorrect.mp3");
  textAlign(CENTER);
  textSize(20);
}

void draw() {
  background(0);
  fill(255);
  for (int i=0; i<starsPosX.length; i++) {
    circle(starsPosX[i], starsPosY[i], 3);
  }
  if (scene==0) {
    text("Shoot an enemy!", 200, 380);
    if (hit!=0)drawSquid("EASY", 80, 50);
    if (hit!=1)drawOctopus("NORMAL", 200, 50);
    if (hit!=2)drawCrab("HARD", 320, 50);
    if (hit==0) {
      enemy="squid";
      hit=-1;
      scene=1;
    }
    if (hit==1) {
      enemy="octopus";
      hit=-1;
      scene=1;
    }
    if (hit==2) {
      enemy="crab";
      hit=-1;
      scene=1;
    }
  } else if (scene==questions.length) {
    for (int i=0; i<scores.length(); i++) {
      if (scores.charAt(i)=='0')fill(0, 255, 0);
      else fill(255, 0, 0);
      text("Q"+(i+1)+"."+questions[i][4],width/2, 100+40*i);
       text("/Answer: "+questions[i][answers[i]], width/2, 120+40*i);
    }
    if (enemy=="squid")drawSquid("Back to home", width/2, 30);
    if (enemy=="octopus")drawOctopus("Back to home", width/2, 30);
    if (enemy=="crab")drawCrab("Back to home", width/2, 30);
    if (hit==0) {
      sceneChange=true;
      sceneChange();
    }
  } else {
    text("Q"+scene+"."+questions[scene-1][4], width/2, 15);
    if (enemy=="squid") {
      for (int i=0; i<4; i++) {
        fill(0, 255, 0);
        if (hit!=i)drawSquid(questions[scene-1][i], 50+100*i, 50);
        else {
          if (hit==answers[scene-1]) {
            drawCircle(50+100*i, 50);
            if (scores.length()==scene-1)scores+=0;
          } else {
            drawCross(50+100*i, 50);
            if (scores.length()==scene-1)scores+=1;
          }
          sceneChange=true;
          sceneChange();
        }
      }
    }
    if (enemy=="octopus") {
      for (int i=0; i<4; i++) {
        fill(255, 255, 0);
        if (hit!=i)drawOctopus(questions[scene-1][i], 50+100*i, 50);
        else {
          if (hit==answers[scene-1]) {
            drawCircle(50+100*i, 50);
            if (scores.length()==scene-1)scores+=0;
          } else {
            drawCross(50+100*i, 50);
            if (scores.length()==scene-1)scores+=1;
          }
          sceneChange=true;
          sceneChange();
        }
      }
    }
    if (enemy=="crab") {
      for (int i=0; i<4; i++) {
        fill(0, 255, 255);
        if (hit!=i)drawCrab(questions[scene-1][i], 50+100*i, 50);
        else {
          if (hit==answers[scene-1]) {
            drawCircle(50+100*i, 50);
            if (scores.length()==scene-1)scores+=0;
          } else {
            drawCross(50+100*i, 50);
            if (scores.length()==scene-1)scores+=1;
          }
          sceneChange=true;
          sceneChange();
        }
      }
    }
  }
  drawAircraft();
  if (clicked)shoot();
  if (playIncorrectSound) {
    incorrectSound.play();
    incorrectSound.rewind();
    playIncorrectSound=false;
  }
  if (playCorrectSound) {
    correctSound.play();
    correctSound.rewind();
    correct++;
    playCorrectSound=false;
  }
}

void mousePressed() {
  lazerSound.play();
  lazerSound.rewind();
  clicked=true;
  getMouseX=mouseX;
  getFrameCount=frameCount;
}
