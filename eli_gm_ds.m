clc
close all

%sposób oznaczania->gm co liczymy, ds to co mamy zbadać dla paru wartości

Uds=[1 2 3 4];

Ugs=linspace(0,10);
% B=0.5; %TODO znaleźć B
Ut=1;
tox=30e-9;
WL=10;
ruchliwosc=0.06;
% Cox=E0*Er/tox
% E0=8.854e-12F/m
% Er=3.9 for SiO2
Cox=(8.854e-12)*3.9/tox
B=Cox*ruchliwosc*WL

Wypadkowa=0;
figure
 for i=1:   length(Uds)
    Id=B*(Uds(i));
    Idsat=B*(Ugs-Ut);
    for k=1:length(Ugs)
      if(Ut>Ugs(k))
          Wypadkowa(k)=0;
      elseif((Ugs(k)-Ut)>Uds(i))
          Wypadkowa(k)=Id;
      else
          Wypadkowa(k)=Idsat(k);
      end    
    end
  
  
%  Wypadkowa=min(Id,Idsat)
  hold on
  plot(Ugs,Wypadkowa);
  hold on
   
 end
 legend("Uds=1V","Uds=2V","Uds=3V","Uds=4V")
 xlabel("Ugs[V]")
 ylabel("gm[S]")
 title("rodzina gm = f (Ugs) dla Uds=[1 2 3 4]")
 
hold off