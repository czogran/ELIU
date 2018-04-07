clc
close all

%podpunkt pierwszy tak mi się niefortunnie nazwal, bo myslalem ze wsyztsko zrobię w jednym skrypcie, a wyszlo inaczej

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


% figure
% Id=((Ugs-Ut).* Uds(2)-Uds(2)^2).*B;
% Idsat=B/2*(Ugs-Uds(2)).^2;
% figure
% 
%  plot(Ugs,Id)
%  hold on
%  plot(Ugs,Idsat);
%  hold off
indeks1=0;
indeks2=0;
indeks3=0;

Wypadkowa=0;
figure
 for i=1:   length(Uds)
    Id=((Ugs-Ut).* Uds(i)-Uds(i)^2/2)*B;
    Idsat=B/2*(Ugs-Ut).^2;
    for k=1:length(Ugs)
      if(Ut>Ugs(k))
          Wypadkowa(k)=0;
           if (indeks1==0)
           text(Ugs(k), Wypadkowa(k)+0.05e-2,"PODPROGOWY",'Color','black','FontSize',12);
           indeks1=1
          end
      elseif((Ugs(k)-Ut)>Uds(i))
          Wypadkowa(k)=Id(k);
           indeks2=mod(k,66)
          if (indeks2==0)
               text(Ugs(k),Wypadkowa(k),"NIENASYCENIE",'Color','red','FontSize',12);         
          end
      else
          Wypadkowa(k)=Idsat(k);
            indeks3=mod(k,30)
          if (indeks3==0)
               text(Ugs(k),Wypadkowa(k),"NASYCENIE",'Color','blue','FontSize',12,'HorizontalAlignment','center');
              
          end
      end    
    end
  
  
%  Wypadkowa=min(Id,Idsat)
  hold on
   plot(Ugs,Wypadkowa);
   hold on

   
    
 end
  legend("Uds=1V","Uds=2V","Uds=3V","Uds=4V")
 xlabel("Ugs[V]")
 ylabel("Id[A]")
 title("charakterystki przejściowe dla Id=f(Ugs) dla UDS=[1 2 3 4]")
 
 
hold off