Table table;
int leftMargin ;
  int topMargin;
  float plotW ;
  float plotH ;
  float offsetX;
  float offsetY;
  PFont f;

void setup() {
  size(2000,1000);
  //fullScreen();
  background(255);
  table= loadTable("minard-data.csv", "header");
    leftMargin = 75;
  topMargin = 75;
  plotW = width - leftMargin*2;
  plotH = height - topMargin*2;
  offsetX = leftMargin;
  offsetY = topMargin;
  f = createFont("Arial",16,true);
  
}

void draw() {
  stroke(20);
  strokeWeight(20);
  fill(0);
  for (int i=0;i<table.getRowCount()-1; i++){
    TableRow rowcurr= table.getRow(i);
    TableRow rownext= table.getRow(i+1);
    drawMap(rowcurr);
    drawPath(rowcurr,rownext);
  }
}

void drawMap(TableRow row){
  stroke(20);
  strokeWeight(20);
  fill(0);
    float valX= row.getFloat("LONC");
    float valY= row.getFloat("LATC");
    String city=row.getString("CITY");
    float posX = map(valX, 24, 37.6, offsetX, offsetX + plotW);
    float posY = height-map(valY, 54.3, 55.8, offsetY, offsetY + plotH);
    textFont(f,16);        
    text(city,posX+20,posY);
    point(posX,posY);
    
}
void drawPath(TableRow row1,TableRow row2){
  
  strokeWeight(10);
  stroke(0, 200, 200);
  float valX1= row1.getFloat("LONP");
  float valY1= row1.getFloat("LATP");
  
  float posX1 = map(valX1, 24, 37.6, offsetX, offsetX + plotW);
  float posY1 = height-map(valY1, 54.3, 55.8, offsetY, offsetY + plotH);
  
  float valX2= row2.getFloat("LONP");
  float valY2= row2.getFloat("LATP");
  float posX2 = map(valX2, 24, 37.6, offsetX, offsetX + plotW);
  float posY2 = height-map(valY2, 54.3, 55.8, offsetY, offsetY + plotH);
  line(posX1, posY1, posX2, posY2);
  
}