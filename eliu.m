clc
close all

%podpunkt pierwszy tak mi się niefortunnie nazwal, bo myslalem ze wsyztsko zrobię w jednym skrypcie, a wyszlo inaczej

Uds=[1 2 3 4];

Ugs=linspace(0,10);
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

Wypadkowa=0;
figure
 for i=1:   length(Uds)
    Id=((Ugs-Ut).* Uds(i)-Uds(i)^2/2)*B;
    Idsat=B/2*(Ugs-Ut).^2;
    for k=1:length(Ugs)
      if(Ut>Ugs(k))
          Wypadkowa(k)=0;
      elseif((Ugs(k)-Ut)>Uds(i))
          Wypadkowa(k)=Id(k);
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
 ylabel("Id[A]")
 title("charakterystki przejściowe dla Id=f(Ugs) dla UDS=[1 2 3 4]")
 
 
hold off