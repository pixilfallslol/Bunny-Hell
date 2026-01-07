int BUNNY_COUNT = 10;
ArrayList<Bunny> bunnies;
boolean canMove = true;

int frames = 0;

boolean showOutScreen = false;
int outScreenFlash = -1;
int lastChangeTime = -1;

void setup(){
  noStroke();
  imageMode(CENTER);
  rectMode(CENTER);
  ((PGraphicsOpenGL)this.g).textureSampling(2);
  frameRate(1000);
  bunnies = new ArrayList<Bunny>(0);
  for(int i = 0; i < BUNNY_COUNT; i++){
    float[] bCoor = {random(width),random(height)};
    Bunny newBunny = new Bunny(bCoor);
    bunnies.add(newBunny);
  }
  size(1920,1080,P2D);
}

void draw(){
  background(0);
  println(int(frameRate)+" fps");
  drawBunnys();
  drawFocusPrompt();
  frames++;
}

void drawBunnys(){
  for(int b = 0; b < bunnies.size(); b++){
    Bunny cB = bunnies.get(b);
    cB.update();
    cB.show();
  }
}

float animToCoor(float coor, float targetCoor){
  return coor += (targetCoor - coor) * 0.0015;
}

void drawFocusPrompt(){
  if(showOutScreen){
    lastChangeTime++;
    fill(100,200);
    rect(width/2,height/2,width,height);
    fill(255,outScreenFlash);
    if(lastChangeTime >= 50){
      outScreenFlash = 255;
    }
    if(lastChangeTime >= 100){
      lastChangeTime = 0;
    }
    if(lastChangeTime <= 0){
      outScreenFlash = 0;
    }
    textAlign(CENTER);
    textSize(98);
    text("Hover to refocus.",width/2,600);
  }
}

void mouseExited(){
  canMove = false;
  showOutScreen = true;
  println("HI.");
}

void mouseEntered(){
  canMove = true;
  showOutScreen = false;
}
