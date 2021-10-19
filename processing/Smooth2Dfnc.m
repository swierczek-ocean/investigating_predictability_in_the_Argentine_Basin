%Smooth a 2D field with a gaussian filter
%Matt Mazloff
%November 2005
% it can handle nans
%and can also jst do special regions
%Qout = Smooth2Dfnc(nlong,nlat,Q,overlap,siz,std,rmz)

function Qout = Smooth2Dfnc(nlong,nlat,Q,overlap,siz,std,rmz)
%Smooth2Dfnc(nlong,nlat,long,lat,Q,overlap)

%Make gaussian filter

%siz = [7 7];%[5 9]; %MUST BE ODD!!!!!!
%std = 1.5%.67; 

[x,y] = meshgrid(-(siz(2)-1)/2:(siz(2)-1)/2, -(siz(1)-1)/2:(siz(1)-1)/2);
h = exp(-(x.*x + y.*y)/(2*std*std));
h = h/sum(h(:));

% figure(1)
% contourf(h); colorbar; grid on
% h

iext = (siz(1)-1)/2;
jext = (siz(2)-1)/2;
ipk = nlong+2*iext;
jpk = nlat+2*jext;
Qol = zeros(ipk,jpk);
Qol(iext+1:nlong+iext,jext+1:nlat+jext)=Q;

if overlap
    %make overlap
    Qol(1:iext,jext+1:nlat+jext)= Q(nlong-iext+1:nlong,:);
    Qol(nlong+iext+1:ipk,jext+1:nlat+jext)= Q(1:iext,:);
else
    Qol(1:iext,jext+1:nlat+jext)= zeros(iext,nlat);
    Qol(nlong+iext+1:nlong+2*iext,jext+1:nlat+jext)=zeros(iext,nlat);
end
    Qol(:,1:jext)= zeros(ipk,jext);  
    Qol(:,nlat+jext+1:nlat+2*jext)=  zeros(ipk,jext);
    br = zeros(siz);
    Qout = zeros([nlong,nlat]);
    
%NOW SMOOTH

if rmz 
  %  fprintf('CMM> warning, removing zeros from average is much slower')
    for j=1:nlat
        for i = 1:nlong
        	br = Qol(i:i+2*iext,j:j+2*jext).*h;
            indij = find((br~=0)) ;
            num = sum(br(:));
            den = sum(h(indij));
            if den>0
                Qout(i,j) = num./den;    
            end
        end
    end
else
   % fprintf('CMM> warning, not removing zeros from average')
    for is = 1 : siz(1) 
        for js = 1:siz(2)
            Qout = Qout + (Qol(is:nlong+is-1,js:nlat+js-1).*h(is,js));
               % h(is,js);
        end
end
end
    return

