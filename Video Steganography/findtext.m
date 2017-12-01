function data = findtext(redc,greenc,bluec)
txt=0;
if bitand(redc,4)== 4
    txt=bitor(txt,128);
end
if bitand(redc,2)== 2
    txt=bitor(txt,64);
end
if bitand(redc,1)== 1
    txt=bitor(txt,32);
end
if bitand(greenc,4)== 4
    txt=bitor(txt,16);
end
if bitand(greenc,2)== 2
    txt=bitor(txt,8);
end
if bitand(greenc,1)== 1
txt=bitor(txt,4);
end
if bitand(bluec,2)== 2
    txt=bitor(txt,2);
end
if bitand(bluec,1)== 1
    txt=bitor(txt,1);
end
data=txt;
return

