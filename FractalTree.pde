private double fractionLength = .8; 
private int smallestBranch = 6; 
private double branchAngle = .2;  
public void setup() 
{   
  size(640, 480);    
} 
public void draw() 
{   
  background(0);   
  stroke(0, 255, 0);   
  line(320, 480, 320, 380);   
  drawBranches(320,380,100,3*Math.PI/2);  
} 
public void keyPressed(){
  if(key == 'd'){branchAngle+=0.05;}   
  if(key == 'a'){branchAngle-=0.05;}
  if(key == 'w' && fractionLength<0.8){fractionLength+=0.05;}   
  if(key == 's' && fractionLength>0.05){fractionLength-=0.05;}
  if(keyCode == UP && smallestBranch<7){smallestBranch+=0.1;}
  if(keyCode == DOWN && smallestBranch>3){smallestBranch-=0.1;}

  
}

public void drawBranches(int x, int y, double branchLength, double angle) 
{   
  //your code here    
  double angle1;
  double angle2;
  angle1 = angle+branchAngle;
  angle2 = angle-branchAngle;
  branchLength*=fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  line(x,y,endX1,endY1);
  line(x,y,endX2,endY2);
  if(branchLength>smallestBranch){
    drawBranches(endX1,endY1,branchLength, angle1);
    drawBranches(endX2,endY2,branchLength, angle2);
  }
 
}

