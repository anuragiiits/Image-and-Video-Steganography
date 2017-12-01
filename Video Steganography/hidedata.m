function [red,green,blue] = hidedata(redc,greenc,bluec,txt)
red = bitand(redc,248);
green = bitand(greenc,248);
blue = bitand(bluec,252);
if bitand(txt,128)== 128
    red = bitor(red,4);
end

if bitand(txt,64)== 64
    red = bitor(red,2);
end

if bitand(txt,32)== 32
    red = bitor(red,1);
end

if bitand(txt,16)== 16
    green = bitor(green,4);
end

if bitand(txt,8)== 8
    green = bitor(green,2);
end

if bitand(txt,4)== 4
    green = bitor(green,1);
end

if bitand(txt,2)== 2
    blue = bitor(blue,2);
end

if bitand(txt,1)== 1
    blue = bitor(blue,1);
end
end  

