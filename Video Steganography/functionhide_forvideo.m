function [img] = functionhide_forvideo(img,f,start,framesize)   
        s1 = size(img);
        i=1;
        j=1;
        k=start;
        while k<start+framesize
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
end

