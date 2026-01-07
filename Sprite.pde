class Sprite{
  PImage atlas;
  int CELL_W;
  int CELL_H;
  color magenta = color(255,122,243);
  color black = color(0,0,0);
  
  public Sprite(String f, int w, int h){
    atlas = loadImage(f);
    CELL_W = w;
    CELL_H = h;
  }
  
  PImage getImageFromCell(int c, int r){
    return atlas.get(c*CELL_W,r*CELL_H,CELL_W,CELL_H);
  }
  
  void removeBG(PImage img){
    img.loadPixels();
    img.format = ARGB;
    for(int i = 0; i < img.pixels.length; i++){
      int c = img.pixels[i] | 0xFF000000;
      if(c == (magenta | 0xFF000000) || c == (black | 0xFF000000)){
        img.pixels[i] = 0x00000000;
      }
    }
    img.updatePixels();
  }
}
