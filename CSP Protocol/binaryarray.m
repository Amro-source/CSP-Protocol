
clc; clear all; close all;

n=20;
C = zeros(n, 1);
for i=1:length(B)
   C(B(i))=1;
end