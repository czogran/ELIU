clc
close all

Ugs=[1 2 3 4];

Uds=linspace(0,10);
B=0.5; %TODO znaleźć B
Ut=1;


Wypadkowa=0;
figure
 for i=1:   length(Ugs)
    Id=B*(-Uds+Ugs(i)-Ut);
    for k=1:length(Uds)
      if(Ut>Ugs(i))
          Wypadkowa(k)=0;
      elseif((Ugs(i)-Ut)>Uds(k))
        Wypadkowa(k)=Id(k);
      else
          Wypadkowa(k)=0;
      end    
    end
  
  
%  Wypadkowa=min(Id,Idsat)
  hold on
   plot(Uds,Wypadkowa);
   hold on

  
 end
 
  legend("Uds=1V","Uds=2V","Uds=3V","Uds=4V")
 xlabel("Uds[V]")
 ylabel("gds[S]")
 title("rodzina gds = f (Uds) dla Ugs=[1 2 3 4]")
hold off