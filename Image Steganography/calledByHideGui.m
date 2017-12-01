function [img,status] = calledByHideGui(name,text)    
    % encrypt
    %img = imread('1.jpg');
    img = imread(name);
    f1 = fopen(text,'r');
    f = fread(f1);
    s = char(f');
    fclose(f1);
    % reading file message and all.

    s1 = size(img);
    sizeo = s1(1)*s1(2);
    s2 = size(f);
    filesize = s2(1);
    % sizes of everything

    if filesize > sizeo
       disp('Text file size is tooooooo big');
       status=0;
    else
        status=1;
         disp('Text file size is ok.');
        i=1;
        j=1;
        k=1;
        while k<=filesize
            a=f(k);
            i1 = img(i,j,1);
            i2 = img(i,j,2);
            i3 = img(i,j,3);
            [r1 , g1 ,b1]=hidedata(i1,i2,i3,a);
            img(i,j,1) = r1;
            img(i,j,2) = g1;
            img(i,j,3) = b1;
            if(i<s1(1))
                i=i+1;
            else
                i=1;
                j=j+1;
            end
            k=k+1;
        end
        width = s1(1);
        txtsize = filesize;
        n = size(img);
        if txtsize<256
            img(n(1),n(2),1) = txtsize;
            img(n(1),n(2),2)=0;
            img(n(1),n(2),3)=0;
        elseif txtsize <512
            img(n(1),n(2),1) = 255;
            img(n(1),n(2),2)=txtsize-255;
            img(n(1),n(2),3)=0;
        else
            img(n(1),n(2),1) = 255;
            img(n(1),n(2),2)=255;
            img(n(1),n(2),3)=txtsize-510;  
        end
        a=5
        imwrite(img,'secret.bmp','bmp');
        %imshow(img)
    end
    %helpdlg ('data hided yeeeeeeeeee');

    %function hidet
end


