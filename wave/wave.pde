float masterClock = 0;
float stretch;
float colorOffset;

float spacing;
float edge;
float topx[] = new float[50];
float botx[] = new float[50];
float topy[] = new float[50];
float boty[] = new float[50];

void setup(){
  colorMode(HSB, 100);
  size(600,600);
  background(100);
  spacing = 15;
  edge = 50;
  for(int i = 0; i<34; i++){
    topx[i] = 50 + spacing*i;
    botx[i] = 50 + spacing*i;
  }
 
 
  stretch = 3;
  colorOffset = 48;
 
}

void draw(){
  background(100);
  strokeWeight(10);
  strokeCap(ROUND);
  
  
  
  for(int i  = 0; i<34; i++){
   float myClockTop = masterClock + i*PI/(-80); // Add offset of each arc
   myClockTop = myClockTop * TWO_PI;                 // Turn into a radian
   myClockTop = sin(myClockTop);                    // Get a sine wave
   myClockTop = (myClockTop + 1) /2;                // Make sine go between 0 and 1
   myClockTop = myClockTop * TWO_PI;                     // Turn into a radian again
   
   float myClockBot = masterClock + i*PI/(80); // Add offset of each arc
   myClockBot = myClockBot * TWO_PI;                 // Turn into a radian
   myClockBot = sin(myClockBot);                    // Get a sine wave
   myClockBot = (myClockBot + 1) /2;                // Make sine go between 0 and 1
   myClockBot = myClockBot * TWO_PI;                     // Turn into a radian again
    
    
    //topy[i] = 300 - myClockTop*30;
    //boty[i] = 300 + myClockBot*30;
    
    
    if(i<17){
      topy[i] = 300 - (myClockTop*(log(i/1.2)*8));
      boty[i] = 300 + (myClockBot*(log(i/1.2)*8));
      
    }
    else{
      topy[i] = 300 - (myClockTop*(log((34-i)/1.2)*8));
      boty[i] = 300 + (myClockBot*(log((34-i)/1.2)*8));
    }
    
  }
  for(int i = 0; i< 34; i++){

    float myColor = (botx[i])/2 / height * 100;
    myColor = myColor/stretch;
    myColor = myColor + colorOffset;
    myColor = myColor % 100;
    
    if(i>17){
      myColor = 100-myColor+12;
    }
   
    
    stroke(myColor,50, 88);
    line(topx[i], topy[i], botx[i], boty[i]);
  }
 
  
  masterClock = masterClock + 0.01;
  //Uncomment saveFrame and exit to get your animation
  //saveFrame("f####.png");
  if (masterClock >= 1) {
    masterClock = 0;
    //exit();
  }
  
}
