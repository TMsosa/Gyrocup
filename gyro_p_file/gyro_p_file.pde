import processing.serial.*;

Serial myPort;  // Create object from Serial class
String axis; // Checks incoming strings.
//int val; //Checks incoming integers.
//boolean xCheck = false;
//boolean yCheck = false;

boolean firstContact = false;
//Square Variables
int x = 50;
int y = 50;



void setup(){
  size(640,480); //Screen settings
  background(100,100,100);//

  //printArray(Serial.list()); //checks all ports
  
  
  String portName = Serial.list()[12]; //change the 0 to a 1 or 2 etc. to match your port
  //String portName2 = Serial.list()[1]; //change the 0 to a 1 or 2 etc. to match your port
  
  myPort = new Serial(this, portName, 9600);
 // Serial port2 = new Serial(this, portName2, 9600);
  myPort.bufferUntil('\n');
  myPort.clear();// Clear out the first reading, in case we started reading in the mid of a value.
}



void serialEvent (Serial myPort) {
  
  axis = myPort.readStringUntil('\n');
   
   if (axis != null) {
     axis = trim(axis);
     println(axis);
     
     if (firstContact == false) {

  
  //if(myPort.available() > 0 ){// If data is available.
    //axisData = port1.readStringUntil(40); //@ symbol  Dec: 64; Hex: 40
    
    //axis = myPort.readString();
    //axis = myPort.read();
    //println(axis);
    
  if(axis.equals("A")){
    myPort.clear();
    firstContact = true;
    //myPort.read();
    println("contact");
    }
    
    else {
      println(axis);
    
   //if(axis == "Y:"){
   //  firstContact = true;
   //}
   
   //if(xCheck){
   //  x = val;
   //  xCheck = false;
   //  println(val);
   //  println("found x");
   //}
   // if(yCheck){
   //  y = val;
   //  yCheck = false;  
   //  println(val);
   //  println("found y");
   //}
  }
  }
   }
   }
void draw(){
  background(100,100,100);//

  fill(0,0, 0);
  stroke(255,255,255);
  rect(195,200,x,y);
}

void ScreenResize(){
  while(myPort.available() > 0){
    int data = myPort.read();
    fill(0,(data/2), data);
    //stroke(70,65,65);
    rect(195,200,100,100);
  }
}
