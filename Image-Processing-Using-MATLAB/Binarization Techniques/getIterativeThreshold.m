function result=getIterativeThreshold(mB,mF,hist)
    %height=size(inputImage,1);
    %width=size
    diff=mB-mF;
    T=0;
    if(diff<0)
        diff=diff*(-1);
    end
    while(diff>2)
        T=uint16(round((mB+mF)/2));
        B=double((1:T));
        F=double((T+1:256));
        sumB=dot(B,hist(1:T));
        disp(sumB);
        sumF=dot(F,hist(T+1:256));
        mB=sumB/size(B,2);
        mF=sumF/size(F,2);
        diff=mB-mF;
        if(diff<0)
            diff=diff*(-1);
        end
    end
    result=uint8(T);
end