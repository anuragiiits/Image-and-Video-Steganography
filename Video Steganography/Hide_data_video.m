function[status] = Hide_data_video(vidfile,txtfile)
        vidObj = VideoReader(vidfile);
        frameCnt = vidObj.NumberOfFrames;
        
        vidObj = VideoReader(vidfile);
        
        videoOut = VideoWriter('output','Uncompressed AVI');
        videoOut.FrameRate = vidObj.FrameRate;
        open(videoOut);
        
        f1 = fopen(txtfile,'r');
        f = fread(f1);
        s = char(f');
        fclose(f1);
        
        fiig = figure('visible', 'off');
        currAxes = axes;
        
        count=0;
        s2 = size(f);
        sizeText = s2(1);
        sizeVideo = frameCnt *(vidObj.width * vidObj.height);
        framesize=(vidObj.width * vidObj.height);
        count=0;
        if(sizeText>sizeVideo)
            status = 0;
            disp('Text file size is too big');
        else
            %array = zeros(960,1280,3,778);
            k=1;
            while(k<=sizeText)
                
                if hasFrame(vidObj)
                    count=count+1;
                    vidFrame1 = readFrame(vidObj);
                    if(k+framesize<=sizeText)
                        
                        vidFrame2 = functionhide_forvideo(vidFrame1,f,k,framesize);
                        k=k+framesize;
                    else
                       
                        vidFrame2 = functionhide_forvideo(vidFrame1,f,k,sizeText-k+1);
                        k=sizeText+1;
                    end
                    writeVideo(videoOut,vidFrame2);
                end
            end
            
        end
            %array={};


            %count = 0;
            %vidFrame1 = readFrame(vidObj);
            %vidFrame2 = readFrame(vidObj);
            %vidFrame3 = readFrame(vidObj);
            %vidFrame4 = readFrame(vidObj);
            % Read video frames until available

            while hasFrame(vidObj)
                count=count+1;
                vidFrame = readFrame(vidObj);
                %array = [array, vidFrame];
                writeVideo(videoOut,vidFrame);
                %image(vidFrame, 'Parent', currAxes);
                %count=count+1;
                %array(:,:,:,count) = vidFrame;
                %currAxes.Visible = 'off';
                %pause(10/vidObj.FrameRate);
           end
        %end

        close(videoOut);
        secretkey=dec2bin(sizeText);
        fid = fopen('key.txt','wb');
        fwrite(fid,char(secretkey),'char');
        fclose(fid);
        status = 1;
end