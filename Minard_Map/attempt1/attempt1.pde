void setup() {
  size(2000,1000);
  //fullScreen();
  background(255);
  
  
}

void draw() {
  int leftMargin = 75;
  int topMargin = 75;
  float plotW = width - leftMargin*2;
  float plotH = height - topMargin*2;
    float offsetX = leftMargin;
    float offsetY = topMargin;
  Table locationTable = loadTable("location.csv", "header");
  stroke(20);
  strokeWeight(20);
  fill(0);
  //point 500 
  PFont f = createFont("Arial",16,true);

  for (int i=0;i<locationTable.getRowCount(); i++){
    TableRow row= locationTable.getRow(i);
    float valX= row.getFloat("LONC");
    float valY= row.getFloat("LATC");
    String city=row.getString("CITY");
    
    
    
    float posX = map(valX, 24, 37.6, offsetX, offsetX + plotW);
    float posY = height-map(valY, 54.3, 55.8, offsetY, offsetY + plotH);
    
    textFont(f,16);        
   
    text(city,posX+20,posY);
    
    point(posX,posY);
    
    
    
  }
}