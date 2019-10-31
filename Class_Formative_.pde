Pacman p;
int screen=0;


void setup()
{

  p= new Pacman();
  size(500, 500);
}

void draw()
{
  if(screen==0)
  {
  background(0);
  textSize(30);
  fill(255,0,0);
  text("Press Space to Start",100,200);
  text("W A S D to move",100,250);
  text("50 points to Win",100,300);
  text("Press P to get points",100,350);
  text("while hovering over Pacman",50,400);
  }
  if (screen==1) {
    background(255, 255, 255);
    p.Update();
    p.Ghost();
    p.keyPressed();
  }
}

void keyPressed()
{
 if(key == ' ')
 {
   screen=screen+1;
 }
  
  
  
}
