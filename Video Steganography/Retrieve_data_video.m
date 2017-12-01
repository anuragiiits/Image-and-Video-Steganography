function[status] = Retrieve_data_video(vidfile,key)
    status=0;
    vidObj = VideoReader(vidfile);
    frameCnt = vidObj.NumberOfFrames;
    vidObj = VideoReader(vidfile);
    
    f1 = fopen(key,'r');
        f = fread(f1);
        s = char(f');
        fclose(f1);
        
    filesize=bin2dec(s);
    framesize=(vidObj.width * vidObj.height);
    vidObj.height
    j=1;
    R=zeros(1,filesize);
    s=1;
    while j<=filesize/framesize
         target = readFrame(vidObj);
         i=1;j=1;k=1;
         while k<=framesize
            r1=target(i,j,1);
            r2=target(i,j,2);
            r3=target(i,j,3);
            R(s)=findtext(r1,r2,r3);
            if(i<vidObj.height)
                         i=i+1;
            else
                        i=1;
                        j=j+1;
            end
            k=k+1;
            s=s+1;
         end 
    end
    if(mod(filesize,framesize)~=0)
        target = readFrame(vidObj);
         i=1;j=1;k=1;
         while k<=mod(filesize,framesize)
            r1=target(i,j,1);
            r2=target(i,j,2);
            r3=target(i,j,3);
            R(s)=findtext(r1,r2,r3);
            if(i<vidObj.height)
                         i=i+1;
            else
                        i=1;
                        j=j+1;
            end
            k=k+1;
            s=s+1;
         end 
    end

    fid = fopen('x.txt','wb');
    fwrite(fid,char(R),'char');
    fclose(fid);
    status=1;
end