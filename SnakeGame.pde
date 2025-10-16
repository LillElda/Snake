ArrayList<Integer> x = new ArrayList<Integer>(), y = new ArrayList<Integer>();
int w=30, h=30, blocks=20, direction = 2, foodx = 15, foody = 15, points = 1;
int[]x_direction={0, 0, 1, -1}, y_direction={1,-1, 0, 0};
boolean gameOver = false;

void setup() {
  size(600, 600);
  x.add(0);
  y.add(15);
}
void draw(){
  background(0);
  fill(58,168,50);
  if(!gameOver){ //while alive
    for (int i = 0; i< x.size(); i++){ // Make boxes as long as the snake should be
      rect(x.get(i)*blocks, y.get(i)*blocks, blocks, blocks);} // boxes
  
    fill(255); //food colour
    rect(foodx*blocks, foody*blocks, blocks, blocks); //food
    textAlign(CENTER, CENTER);
    textSize(15);
    text("LENGTH/POINTS: "+points, 70, 30);
  
    if (frameCount%5==0){
      x.add(0, x.get(0) + x_direction[direction]);
      y.add(0, y.get(0) + y_direction[direction]);
    
      if(x.get(0) ==foodx && y.get(0)== foody){
        points +=1;
        print(points);
        foodx = (int)random(0, w);
        foody = (int)random(0, h);
      }
      else{
        x.remove(x.size()-1);
        y.remove(y.size()-1);
      }
      
      if(x.get(0) == 31 || x.get(0) == -1 || y.get(0) == 31 || y.get(0) == -1)
      {
        gameOver = true;
      }
     for (int i = 0; i< x.size() - 1; i++){
       if (x.get(i).equals(x.get(x.size()-1))){
         if (y.get(i).equals(y.get(y.size()-1))){
         gameOver = true;
         break;
         }
       }
      }
    } 
  }
  if(gameOver){
      fill(255, 0, 0); // Red color for game over text
      textSize(48);
      text("GAME OVER", width / 2, height / 2 - 20);
    }
}

void keyPressed(){
  int newDirection=keyCode == DOWN? 0:(keyCode==UP?1:(keyCode==RIGHT?2:(keyCode==LEFT?3:-1)));
  if (newDirection != -1 && !gameOver){
    direction = newDirection;
  }
  if (gameOver  && key == ENTER){
    gameOver = false;
    restart();
  }
}

void restart(){
  points = 1;
  x = new ArrayList<Integer>();
  y = new ArrayList<Integer>();
  x.add(0);
  y.add(15);
  direction = 2;
}
