class Bunny{
  Sprite bAtlas;
  PImage bunnyIdle;
  float[] coor;
  float targetX;
  float targetY;
  float lastSwitchTime = -1;
  float TIME_SPEED = 0.1;
  int id = int(random(0,100));
  boolean dead = false;
  public Bunny(float[] _coor){
    bAtlas = new Sprite("atlas.png",45,45);
    bunnyIdle = bAtlas.getImageFromCell(0,0);
    bAtlas.removeBG()bunnyIdle;
    coor = _coor;
    targetX = coor[0];
    targetY = coor[1];
  }
  
  void newCoor(){
    targetX = random(width);
    targetY = random(height);
  }
  
  void update(){
    lastSwitchTime += TIME_SPEED;
    if(lastSwitchTime >= 50 && canMove){
      newCoor();
      lastSwitchTime = -1;
    }
    coor[0] = animToCoor(coor[0],targetX);
    coor[1] = animToCoor(coor[1],targetY);
  }
  
  void show(){
    if(!dead){
      float bunnyAnim = sin(frames * 0.06) * 6;
      fill(255);
      textAlign(CENTER);
      textSize(50);
      text("Bunny "+id,coor[0],bunnyAnim+coor[1]-75);
      image(bunnyIdle,coor[0],coor[1]+bunnyAnim,100,100);
    }
  }
}
