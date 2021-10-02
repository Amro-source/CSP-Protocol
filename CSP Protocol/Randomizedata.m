function data=Randomizedata(sizeInBytes)
C = randi([0 255],1,sizeInBytes);
C = uint8(C);

% y=bin2dec(C);

data=C;

end