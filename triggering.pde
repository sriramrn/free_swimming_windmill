import processing.serial.*;
import cc.arduino.*;

Arduino arduino;
//Trigger input
int trigswitch = 0;

int trig_pin = 7;
int trig_state = Arduino.LOW;

int trig_out = 12;
int trig_out_state = Arduino.LOW;
int trig_out_time = 0;

int trig_out_dur = 50;

boolean self_timed = true;
int self_trig_out = 8;
int self_trig_state = 0;
int self_trig_time = 0;

int initDelay = 3;  //time in seconds to wait for first trigger 
boolean init = false;
int initTime = initDelay*1000;

int end_trig_state = 0;
int end_trig_time = 0;
Boolean end = false;