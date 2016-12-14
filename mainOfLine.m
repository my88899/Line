clc;clear;close all
lineStart = [2,1.5,3];
lineEnd = [1,1,1];
nParts = 16;
antennaPoint = {[1,0,0],[-1,0,0],[0,0,1]};
r = coutFromLine(lineStart,lineEnd,nParts,antennaPoint);
mux_fl_01