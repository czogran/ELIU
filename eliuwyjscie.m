clc
close all

Ugs=[1 2 3 4];

Uds=linspace(0,10);
B=0.5; %TODO znaleźć B
Ut=1;

% figure
% Id=((Ugs-Ut).* Uds(2)-Uds(2)^2).*B;
% Idsat=B/2*(Ugs-Uds(2)).^2;
% figure
% 
%  plot(Ugs,Id)
%  hold on
%  plot(Ugs,Idsat);
%  hold off

%to do zaznaczenia odzielenia nasycenia od nienasycenia
 pomoc=Ugs-Ut;
 Ugs1=linspace(1,4);
szkic=linspace(pomoc(1),pomoc(length(pomoc)));
  Idsat=B/2*(Ugs1-Ut).^2;

p=polyfit(szkic,Idsat,5);
f=polyval(p,szkic);


Wypadkowa=0;
figure
 for i=1:   length(Ugs)
   Id=((Ugs(i)-Ut).* Uds-Uds.^2/2).*B;   
   Idsat=B/2*(Ugs(i)-Ut).^2;
   for k=1:length(Uds)
      if(Ut>Ugs(i))
          Wypadkowa(k)=0;
      elseif((Ugs(i)-Ut)>Uds(k))
          Wypadkowa(k)=Id(k);
      else
          Wypadkowa(k)=Idsat;
      end    
   end
  
  
%  Wypadkowa=min(Id,Idsat)
  hold on
   plot(Uds,Wypadkowa);
   hold on

   
    
 end
%  p=polyfit(Ugs,pomoc,5);
%  f=polyval(p,Uds)
  plot(szkic,f);
  
  
  
   legend("Uds=1V","Uds=2V","Uds=3V","Uds=4V","Id(Usat)?????? jak nazwać tą krzywa")
 xlabel("Uds[V]")
 ylabel("Id[A]")
 title("rodzina charakterystyk wyjściowych Id=f(Uds) dla Ugs=[1 2 3 4]")
hold off