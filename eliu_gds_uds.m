clc
close all

Uds=[1 2 3 4];

Ugs=linspace(0,10);
B=0.5; %TODO znaleźć B
Ut=1;


tox=30e-9;
WL=10;
ruchliwosc=0.06;
% Cox=E0*Er/tox
% E0=8.854e-12F/m
% Er=3.9 for SiO2
Cox=(8.854e-12)*3.9/tox
B=Cox*ruchliwosc*WL

indeks1=0;
indeks2=0;
indeks3=0;


Wypadkowa=0;
figure
 for i=1:   length(Uds)
    Id=B*(Ugs-Ut-Uds(i));
    for k=1:length(Ugs)
      if(Ut>Ugs(k))
          Wypadkowa(k)=0;
           if (indeks1==0)
           text(Ugs(k), Wypadkowa(k)+0.1e-3,"PODPROGOWY",'Color','black','FontSize',12);
           indeks1=1
          end
      elseif((Ugs(k)-Ut)>Uds(i))
        Wypadkowa(k)=Id(k);
         indeks2=mod(k,66)
          if (indeks2==0)
               text(Ugs(k),Wypadkowa(k),"NIENASYCENIE",'Color','red','FontSize',12);         
          end
      else
        Wypadkowa(k)=0;
          indeks3=mod(k,40)
          if (indeks3==0)
               text(Ugs(k),Wypadkowa(k)+0.1e-3,"NASYCENIE",'Color','blue','FontSize',12,'HorizontalAlignment','center');
              
          end
      end    
    end
  
  
%  Wypadkowa=min(Id,Idsat)
  hold on
   plot(Ugs,Wypadkowa);
   hold on
 legend("Uds=1V","Uds=2V","Uds=3V","Uds=4V")
 xlabel("Ugs[V]")
 ylabel("gds[S]")
 title("rodzina gds = f (Ugs) dla UDS=[1 2 3 4]")
   
    
end
hold off