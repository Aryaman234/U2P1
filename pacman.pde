class Pacman
{
  float _pacmanX;
  float _pacmanY;
  float _ghostX;
  float _ghostY;
  float _velocityX;
  float _velocityY;
  PImage pacman;
  PImage ghost;
  float _D;
  int _score = 0;
  int _point = 1;


  Pacman()
  {
    _pacmanX = random(0, 500);
    _pacmanY = random(0, 500);
    _ghostX=250;
    _ghostY=250;
    _velocityX = 1;
    _velocityY = 1;
    pacman=loadImage("pacman.png");
    ghost=loadImage("ghost.png");
  }

  Pacman(float x, float y, float xvel, float yvel)
  {
    _pacmanX = x;
    _pacmanY = y;
    _velocityX = xvel;
    _velocityY = yvel;
  }

  void Move()
  {
    _pacmanX = _pacmanX + _velocityX;
    _pacmanY = _pacmanY + _velocityY;
  }

  void Bounce()
  {
    if (_pacmanX > 490 || _pacmanX < 0)
    {
      _velocityX = _velocityX * -1;
    }
    if (_pacmanY > 490 || _pacmanY < 0)
    {
      _velocityY *=-1;
    }
  }

  void Draw()
  {
    image(pacman, _pacmanX, _pacmanY, 50, 50);

    fill(0);
    text("Score:"+_score, 20, 50);
  }

  void Ghost()

  {
    image(ghost, _ghostX, _ghostY, 50, 50);
  }

  void Edge()
  {
    if (_ghostX > 460)
    {
      _ghostX=_ghostX-3;
    }
    if (_ghostX < 0)
    {
      _ghostX=_ghostX+3;
    }
    if (_ghostY < 0)
    {
      _ghostY=_ghostY+3;
    }
    if (_ghostY > 460)
    {
      _ghostY=_ghostY-3;
    }
  }

  void Gameover()
  {
    if (_score>50)
    {
      background(0);
      _pacmanX=1000;
      _velocityX=0;
      _ghostX=1000;
      textSize(30);
      fill(255, 0, 0);
      text("Game Over", 170, 250);
    }
  }

  void Update()
  {
    Move();
    Bounce();
    Draw();
    Edge();
    Gameover();
  }

  void keyPressed()
  {
    if (key == 'w')
    {
      _ghostY=_ghostY-3;
    }
    if (key == 's')
    {
      _ghostY=_ghostY+3;
    }
    if (key == 'd')
    {
      _ghostX=_ghostX+3;
    }
    if (key == 'a')
    {
      _ghostX=_ghostX-3;
    }
    if (key == 'p')
    {
      _D=dist(_ghostX, _ghostY, _pacmanX, _pacmanY);
      if (_D<30)
      {
        _score=_score+1;
        _pacmanX=random(10, 490);
        _velocityX= _velocityX+1;
        _velocityY= _velocityY+1;
      }
    }
  }
}
