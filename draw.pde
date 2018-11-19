
void draw() {
  
  currentTime = millis();
  fi = float(currentTime - prevTime)/1000;
  prevTime = currentTime;
  
  if (currentTime >= initTime && !init) {
    
    init = true;
    startTime = currentTime;

    arduino.digitalWrite(self_trig_out, Arduino.HIGH);
    self_trig_state = 1;
    self_trig_time = currentTime;

    arduino.digitalWrite(trig_out, Arduino.HIGH);
    trig_out_state = 1;
    trig_out_time = currentTime;
    
  }

  if (init && repcount < nreps) {
    
    elapsedTime = currentTime - startTime;
    
    repcount = int(elapsedTime/sumduration);
    
    if (repcount != prev_repcount) {
      newrep = true;
    }
    else {
      newrep = false;
    }
    
    prev_repcount = repcount;
    
    elblktime = elapsedTime - (sumduration*repcount);
    
    blkcount = blockNum(elblktime, blocktime);
    
    cur_speed = speed[blkcount];          
    
    if (newrep) {
      randspeed = randseed[int(random(0,randseed.length))];
    }
    
    if (randomize) {
      if (randpos[blkcount] ==1) {
        cur_speed = randspeed;
      }
    }
    
    s = cur_speed*(circ*cf)*fi;    
    
    if (probe_trials[repcount] == 1) {
      s = 0;
    }
    
    a += s*gain;

    windmill(center,r,a,n,w,0,255);
  
  }
  
  if (repcount >= nreps) {
    arduino.digitalWrite(trig_out, Arduino.HIGH);
    trig_out_state = 1;
    trig_out_time = currentTime;
    println("Experiment Complete!");
  }
    
  if (self_trig_state == 1 && currentTime - self_trig_time >= trig_out_dur) {
    arduino.digitalWrite(self_trig_out, Arduino.LOW);
    self_trig_state = 0;
  }
  
  if (trig_out_state == 1 && currentTime - trig_out_time >= trig_out_dur) {
    arduino.digitalWrite(trig_out, Arduino.LOW);
    trig_out_state = 0;
  }
  
}