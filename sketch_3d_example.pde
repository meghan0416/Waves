float masterClock;

class cubeBoi{
  float x;
  float z;
  float offset;
  //float offsetz;
}

float distance(float x, float y){
  return sqrt((x)*(x) + (y)*(y));
}

ArrayList<cubeBoi> cubes = new ArrayList<cubeBoi>();

void setup(){
  size(640,640, P3D);
  masterClock = 0;
  
  for(int i=0; i<15; i++){
    for(int j=0; j<15; j++){
      cubeBoi myBoi = new cubeBoi();
      myBoi.x = -70 +i*10;
      myBoi.z = -70 + j*10;
      myBoi.offset = -abs(distance(myBoi.x, myBoi.z)/100);
      cubes.add(myBoi);
    }
  }
  
}

void draw(){
  noStroke();
  background(255,220,250);
  fill(200,200, 255);
  ortho();
  ambientLight(65, 84, 132);
  directionalLight(255 * abs(cos(masterClock*TWO_PI)/2),200* abs(sin(masterClock*TWO_PI)/2),200,0,1,0);
  directionalLight(220* abs(sin(masterClock*TWO_PI)/2),200* abs(cos(masterClock*TWO_PI)/2),255,-1,0,0);
  float myClock = masterClock;
  //rect(320,320,100,100);

  translate(320,320,0);
  scale(2,2,2);
  rotateX(radians(-30));
  rotateY(radians(45));
  //rotateX(radians(-mouseY));
  //rotateY(radians(mouseX));

  for(int i = 0; i< cubes.size(); i++){
    cubeBoi myBoi = cubes.get(i);
    pushMatrix();
    translate(myBoi.x, 0, myBoi.z);
    
    float mySinx = (abs(myClock*1-0.5) + myBoi.offset) + 0.5;
    mySinx = abs((acos(mySinx*PI)/2) + (asin(mySinx*PI)/2));
    //mySinx = (mySinx+1)/2;
    

    
    float myHeight = (mySinx);
    
    box(10,myHeight + abs(sin((myClock + myBoi.offset)*TWO_PI))*50,10);
    popMatrix();
  }

 
  //box(200,150* sin(myClock*PI) + 50,200);
  
  /*
  pushMatrix();
  translate(250,0,0);
  box(200,200,200);
  popMatrix();
  
  pushMatrix();
  translate(-250,0,0);
  box(200,200,200);
  popMatrix();
  */


  masterClock = masterClock + 0.01;
  //saveFrame("f####.png");
  if(masterClock >= 1){
    masterClock = 0;
    //exit();
  }
}
