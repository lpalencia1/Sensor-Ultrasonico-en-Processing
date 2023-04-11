import processing.serial.*;

Serial miPuerto;
int pos_x=50;
int pos_y=220;
int data=0;
int diam=40;
float pos_ultra;
float a=0;
PFont f, n;

void setup() {
  miPuerto = new Serial(this, "COM6", 9600);
  size(500, 400);
}

void draw() {

  background(255);
  while (miPuerto.available() > 0) {    
    data = miPuerto.read();                 
    println(data);                           
    pos_ultra=map(data, 5, 300, 20, 480);       
  }
  fill(0, 0, 0);                            
  f = createFont("Arial", 16, true);        
  textFont(f, 30);                          
  text("Distancia:", 130, 130);               
  text(data, 280, 130);                    
  text("cm", 330, 130);                    

  noStroke();                                 
  fill(0);                                    
  ellipse(pos_x+pos_ultra, pos_y, diam, diam);    
  delay(200);                                 

  fill(23, 161, 165);
  
  text("SENSOR ULTRASONIDO", 80, 50);     
}
