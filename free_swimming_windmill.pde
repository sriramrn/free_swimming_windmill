int[] segmentduration = {5,2};
float[] speed = {0,1}; // cm per second at circumference

boolean randomize = false; // randomize speed
float[] randseed = {0.5,1,2};
int[] randpos = {0,1};

int nreps = 2;

float probe_prob = 0.1; // probability of occurance of a probe trial
float gain = 1; // primarily used to invert direction


void setup() {

  size(350,350);
  frameRate(fps);
  noStroke();
  
  background(100);

  center[0] = (width/2)+locOffset[0];
  center[1] = (height/2)+locOffset[1];
  
  windmill(center,r,a,n,w,0,255);
  
  sumduration = arrSum(segmentduration)*1000; // total duration of a segment in milliseconds
  numblocks = segmentduration.length;
  
  blocktime = arrCumSum(segmentduration);
  blocktime = arrUnitConvert(blocktime, 1000);
  
  probe_trials = getTrials(probe_prob, nreps);
  
  //Arduino triggering
  arduino = new Arduino(this, Arduino.list()[1], 115200);
  
  arduino.pinMode(trig_pin, Arduino.INPUT); 
  
  arduino.pinMode(trig_out, Arduino.OUTPUT);
  arduino.digitalWrite(trig_out, Arduino.LOW);
  
  arduino.pinMode(self_trig_out, Arduino.OUTPUT);
  arduino.digitalWrite(self_trig_out, Arduino.LOW);
  
}