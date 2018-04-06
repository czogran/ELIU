clc
close all

Uds=[1 2 3 4];

Ugs=linspace(0,10);
B=0.5; %TODO znaleźć B
Ut=1;


Wypadkowa=0;
figure
 for i=1:   length(Uds)
    Id=B*(Ugs-Ut-Uds(i));
    for k=1:length(Ugs)
      if(Ut>Ugs(k))
          Wypadkowa(k)=0;
      elseif((Ugs(k)-Ut)>Uds(i))
        Wypadkowa(k)=Id(k);
      else
        Wypadkowa(k)=0;
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