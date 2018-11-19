int n = 24;

float cf = 0.018; // cm per pixel
float radius = 3; // radius of windmill in cm
float fps = 60;

int[] locOffset = {0,0};
int[] center = {0,0};
float a = 0;

int r = int(radius/cf);
float w = 360/n;

float circ = TWO_PI*r;

float fi = 1/fps;

float s = speed[0]*(circ*cf)*fi;
float cur_speed = speed[0];
float randspeed;

int currentTime = millis();
int prevTime = currentTime;
int startTime = 0;
int elapsedTime = 0;
int sumduration;
int numblocks;
int[] blocktime = {0,0};
int elblktime;

int repcount = 0;
int blkcount = 0;
int prev_repcount = 0;
boolean newrep = false;

int[] probe_trials;

// Triggering

import cc.arduino.*;
import org.firmata.*;