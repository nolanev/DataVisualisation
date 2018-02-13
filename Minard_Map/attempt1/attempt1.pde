Table table;
int leftMargin ;
int topMargin;
 int bottomMargin;
  float plotW ;
  float plotH ;
  float offsetX;
  float offsetY1;
  float offsetY2;
  PFont f;

void setup() {
  size(2500,1250);
  //fullScreen();
  background(255);
  table= loadTable("minard-data.csv", "header");
  leftMargin = 200;
  topMargin = 700;
  bottomMargin=100;
  plotW = width - leftMargin*2;
  plotH = height - bottomMargin*2;
  offsetX = leftMargin;
  offsetY1 = topMargin;
  offsetY2=bottomMargin;
  f = createFont("Arial",16,true);
  
}

void draw() {
  stroke(20);
  strokeWeight(20);
  fill(0);
  tempMap();
  colourPicker();
  drawMap();
  
}

void drawMap(){
  for (int i=0;i<table.getRowCount()-1; i++){
    TableRow row= table.getRow(i);
    stroke(20);
    strokeWeight(20);
    fill(0);
      float valX= row.getFloat("LONC");
      float valY= row.getFloat("LATC");
      String city=row.getString("CITY");
      float posX = map(valX, 24, 37.6, offsetX, offsetX + plotW);
      float posY = height-map(valY, 54.3, 55.8, offsetY1, offsetY2 + plotH);
      textFont(f,16);        
      text(city,posX+20,posY);
      point(posX,posY);
    }
    
}

void colourPicker(){
    for (int i=0;i<table.getRowCount()-1; i++){
    TableRow rowcurr= table.getRow(i);
    TableRow rownext= table.getRow(i+1);
    String direction=rowcurr.getString("DIR");
    if (direction.equals("A")){
        stroke(#EDCE4F);
        drawPath(rowcurr,rownext);
    }
    else{stroke(#9B090C);
        drawPath(rowcurr,rownext);}
    
} 
  for (int i=0;i<7; i++){
    TableRow rowcurr= table.getRow(i);
    TableRow rownext= table.getRow(i+1);
    String direction=rowcurr.getString("DIR");
    if (direction.equals("A")){
        stroke(#EDCE4F);
        drawPath(rowcurr,rownext);
    }
    else{stroke(#9B090C);
        drawPath(rowcurr,rownext);}
  } 
  
  for (int i=38;i<42; i++){
  TableRow rowcurr= table.getRow(i);
    TableRow rownext= table.getRow(i+1);
    String direction=rowcurr.getString("DIR");
    if (!direction.equals("A")){
        stroke(#9B090C);
        drawPath(rowcurr,rownext);}
  }
  }
  //0 and one
  /*for (int i=0;i<table.getRowCount()-1; i++){
    TableRow rowcurr= table.getRow(i);
    TableRow rownext= table.getRow(i+1);
    String direction=rowcurr.getString("DIR");
    if (direction.equals("A")){
        stroke(#EDCE4F);
        drawPath(rowcurr,rownext);
    }
      }
*/

void drawPath(TableRow row1,TableRow row2){
  float w=row1.getFloat("SURV")/1700;
  strokeWeight(w);

  
  float valX1= row1.getFloat("LONP");
  float valY1= row1.getFloat("LATP");
  
  float posX1 = map(valX1, 24, 37.6, offsetX, offsetX + plotW);
  float posY1 = height-map(valY1, 54.3, 55.8, offsetY1, offsetY2 + plotH);
  
  float valX2= row2.getFloat("LONP");
  float valY2= row2.getFloat("LATP");
  float posX2 = map(valX2, 24, 37.6, offsetX, offsetX + plotW);
  float posY2 = height-map(valY2, 54.3, 55.8, offsetY1, offsetY2 + plotH);
  line(posX1, posY1, posX2, posY2);
  
}

void tempMap(){
  stroke(#D8D8D8);
  strokeWeight(2);
  fill(255);  
  rect(100, 900.0, 2300, 300);  
  line(100,1000,2400,1000);
  line(100,1100,2400,1100);
  
  fill(#AAAAAA);
  textFont(f,16);        
  text("0 deg",2400,900);
  text("-10 deg",2400,1000);
  text("-20 deg",2400,1100);
  text("-30 deg",2400,1200);
  
  fill(0);
  
  float linearray[]={92,300,400,450,530,570,525,535,510,00};
  
  for (int i=0;i<10; i++){
    TableRow row= table.getRow(i);
    float x=row.getFloat("LONT");
    float temp=row.getFloat("TEMP");
    int day=row.getInt("DAY");
    String month=row.getString("MON");
    String lable;
    if (i==4){
      lable= Float.toString(temp) + " deg \n";
    }
    else{ 
      lable= Float.toString(temp) + " deg \n"+ Integer.toString(day)+ "/" + month;
    }
    x=map(x, 24, 37.6, offsetX, offsetX + plotW);
    
    float y=temp;
    float plotH1 = height - 700*2;
    y=height-map(y, -30, 0, 100, 500 + plotH1);
   
   TableRow row1= table.getRow(i+1);
   float x1=row1.getFloat("LONT");
    x1=map(x1, 24, 37.6, offsetX, offsetX + plotW);
    
    float y1=row1.getFloat("TEMP");
    
    y1=height-map(y1, -30, 0, 100, 500 + plotH1);
     
   
    textFont(f,16);        
    text(lable,x,y+20);
    strokeWeight(5);
    stroke(#4CB4E3);
    line(x,y, x1,y1);  
    
    float r =linearray[i];
    stroke(#A9D4E8);
    line(x,y, x, r); //TODO find r
    
  }

}