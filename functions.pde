
void windmill(int[] center, int radius, float angle, int numbars, float barwidth, int[] background, int[] fill) {
  
  background(background[0], background[1], background[2]);
  
  for (int i=0; i<numbars; i++) {
    angle+= 2*barwidth;
    int[] v = get_vertices(center,radius,angle,barwidth/2);
    fill(fill[0], fill[1], fill[2]);
    triangle(center[0],center[1],v[0],v[1],v[2],v[3]);
  }
  
}


int[] get_vertices(int[] center, int radius, float angle, float halfwidth) {
  
  float w = halfwidth;
  
  int x1 = round(radius*cos(radians((angle-w)%360)))+center[0];
  int y1 = round(radius*sin(radians((angle-w)%360)))+center[1];
  int x2 = round(radius*cos(radians((angle+w)%360)))+center[0];
  int y2 = round(radius*sin(radians((angle+w)%360)))+center[1];
  
  int[] vertices = {x1,y1,x2,y2}; 
  
  return vertices;
}


int arrSum(int[] arr){
  int sum = arr[0];
  for (int i = 1; i < arr.length; i++) {
    sum +=arr[i];
  }
  return sum;
}


int[] arrCumSum(int[] arr){
  int[] sum = arr;
  int s = 0;
  for (int i = 0; i < arr.length; i++) {
    s += arr[i];
    sum[i] = s;
  }
  return sum;
}


int[] arrUnitConvert(int[] arr, int multiplier) {
  
  for (int i=0; i<arr.length; i++) {
    arr[i] = arr[i]*multiplier;
  }
  return arr;
}


int blockNum(int elapsed_time, int[] cum_block_time) {
  
  int b = 0;
  int diff = 0;
  for (int i=0; i<cum_block_time.length; i++) {
    
    diff = elapsed_time - cum_block_time[i] ;
    if (diff <= 0) {
      b = i;
      break;
    }
  }
  
  return b;
}


int[] getTrials(float p, int nreps) {
  
  int[] trials = new int[nreps];
  
  int rand;
  
  for (int i=0; i<nreps; i++) {
    
    rand = int(random(0,1/p));
    
    if (rand == 0) {
      trials[i]=1;
    }
    else {
      trials[i] = 0;
    }
    
  }
   
  return trials;

}