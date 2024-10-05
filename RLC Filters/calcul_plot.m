R = str2double(get(BR,'String'));
%R = get(Pop_up_menur, 'Value');
L = str2double(get(BL,'String'));
C = str2double(get(BC,'String'));
%C = get(Pop_up_menuc, 'Value');

tip=get(Pop_up_menu,'Value');
alegere = get(Pop_up_menu2, 'Value');
tipr = get(Pop_up_menu3, 'Value');
valr = get(Pop_up_menu4, 'Value');

Q=sqrt(L/C)./R;
f0=1/(2*pi*sqrt(L*C));
fmin=f0*(sqrt(1+4*Q.^2)-1)/(2*Q);%frecventa minima a benzii de trecere a circuitului rezonant
fmax=f0*(sqrt(1+4*Q.^2)+1)/(2*Q);
Bf=fmax-fmin;%latimea benzii de trecere

x=logspace(-1,1,300);   
f=x.*f0;
w=2.*pi.*f;
w0=2.*pi.*f0;
subplot('Position',[0.01 0.05 0.28 0.2]);



%==========================================================================
if(tip ==1 )
        subplot("Position", [0.1 0.1 0.15 0.15]);
        Img1=imread('1.png');
        image(Img1);
        axis off; 
end
if(tip == 2)
       subplot("Position", [0.1 0.1 0.15 0.15]);
       Img2=imread('2.png');
       image(Img2);
       axis off;
end
if(tip ==3 )
     subplot("Position", [0.1 0.1 0.15 0.15]);
       Img3=imread('3.png');
       image(Img3);
       axis off; 
end
if(tip == 4)
       subplot("Position", [0.1 0.1 0.15 0.15]);
       Img4=imread('4.png');
       image(Img4);
       axis off; 
end
if(tip ==5 )
       subplot("Position", [0.1 0.1 0.15 0.15]);
       Img5=imread('5.png');
       image(Img5);
       axis off; 
end
if(tip == 6)
       subplot("Position", [0.1 0.1 0.15 0.15]);
       Img6=imread('6.png');
       image(Img6);
       axis off; 
end
if(tip ==7 )
        subplot("Position", [0.1 0.1 0.15 0.15]);
        Img7=imread('7.png');
        image(Img7);
        axis off;  
end
if(tip == 8)
       subplot("Position", [0.1 0.1 0.15 0.15]);
       Img8=imread('8.png');
       image(Img8);
       axis off; 
end
if(tip == 9)
       subplot("Position", [0.1 0.1 0.15 0.15]);
       Img9=imread('9.png');
       image(Img9);
       axis off;
end
%--------------------------------------------------------------------------


%--------------------------------------------------------------------------

Opt = get(Pop_up_menu, 'Value');
if Opt==1     
    Titlul='Filtru Trece Jos';
    %formulele in j pentru filtrul trece jos RLC
                num= 1./(j*w.*C);
                den=R+j*w.*L+1./(j*w.*C);
                a=8*Q.^4-4*Q.^2+1;
                b=sqrt((2*Q.^2-1+sqrt(a))/(2*Q.^2));
                fmax=b*f0;
                flim=fmax;
                faza1=(180./pi)*angle(Q./(Q*(1-b.^2)+j*b));
                faza0=-90;
end

if   Opt==2     
    Titlul='Filtru Trece Sus';

     %formulele in j pentru filtrul trece sus RLC
            num= j*w.*L ;
            den=R+j*w.*L+1./(j*w.*C);
                a=8*Q.^4-4*Q.^2+1;
                b=sqrt((-2*Q.^2+1+sqrt(a))/(2*Q.^2));
                fmax=b*f0;
                flim=fmax;
                faza1=(180./pi)*angle(-b.^2*Q./(Q*(1-b.^2)+j*b));
                faza0=90;
end
if Opt==3
    Titlul='Filtru Trece Banda';    

     %formulele in j pentru filtrul trece banda RLC
              num=R; 
              den=R+j.*w.*L+1./(j.*w.*C);
                fmin=f0*(sqrt(1+4*Q.^2)-1)/(2*Q);
                fmax=f0*(sqrt(1+4*Q.^2)+1)/(2*Q);
                Bf=fmax-fmin;
                faza1=45;
                faza2=-45;
end

if  Opt==4   
   Titlul='Filtru Opreste Banda'; 

     %formulele in j pentru filtrul opreste banda RLC
            num= j*w.*L + 1./(j*w.*C);
            den=R+j*w.*L+1./(j*w.*C);
                fmin=f0*(sqrt(1+4*Q.^2)-1)/(2*Q);
                fmax=f0*(sqrt(1+4*Q.^2)+1)/(2*Q);
                Bf=fmax-fmin;

                faza1=-45;
                faza2=45;

end
if  Opt==5 
  Titlul='Filtru Trece Jos'; 

     %formulele in j pentru filtrul trece jos L-CR
            num=R+1./(j*w.*C) ;
            den=R+j*w.*L+1./(j.*w.*C);
                a=8*Q.^4+4*Q.^2+1;
                b=sqrt((2*Q.^2+1+sqrt(a))/(2*Q.^2));
                fmax=b*f0;
                flim=fmax;
                faza1=(180./pi)*angle((j*b+Q)./(Q*(1-b.^2)+j*b));
                faza0=90;

end

if Opt==6
    Titlul='Filtru Trece Sus'; 

     %formulele in j pentru filtrul trece sus RLC
            num=R+j*w.*L ;
            den=R+j.*w.*L+1./(j.*w.*C);
                a=8*Q.^4+4*Q.^2+1;
                b=sqrt((-2*Q.^2-1+sqrt(a))/(2*Q.^2));
                fmax=b*f0;
                flim=fmax;
                faza1=(180./pi)*angle((j*b-Q*b.^2)./(Q*(1-b.^2)+j*b));
end
if Opt==7  
    Titlul='Filtru Trece Sus'; 

     %formulele in j pentru filtrul trece jos RLC
            num=-L*C*R*w.^2 ;
            den=R-L*C*R*w.^2+j*w.*L;
                a=Q.^4-4*Q.^2+8;
                b=sqrt((Q.^2-2+sqrt(a))/2);
                fmax=b*f0;
                flim=fmax;
                faza1=(180./pi)*angle((-b.^2)./(1-b.^2+j*b*Q));
end

if Opt==8  
       Titlul='Filtru Trece Banda'; 
            num=j*w.*L ;
            den=R-L*C*R*w.^2+j*w.*L;
                fmax=f0*(Q+sqrt(Q.^2+4))/2;
                fmin=f0*(-Q+sqrt(Q.^2+4))/2;
                Bf=fmax-fmin;
                faza1=45;
                faza2=-45;
end
if Opt==9 
       Titlul='Filtru Trece Jos'; 
            num=R ;
            den=R-L*C*R*w.^2+j*w.*L;
                 a=Q.^4-4*Q.^2+8;
                b=sqrt((2-Q.^2+sqrt(a))/2);
                fmax=b*f0;
                flim=fmax;
                faza1=(180./pi)*angle(1./(1-b.^2+j*b*Q));
end
%-----------------------------------------------------------------------

%evaluarea formulei Uies/Uin
              h=abs(num./den);
%calculul castigului
              gain=20*log10(h);
%calculul frecventei in functie de w (declarata mai sus)
              %f=w/(2*pi);
%calculul fazei semnalului
                phase=angle(num./den)*180./pi;
                      
%Grafice 

           subplot('Position', [0.35 0.72 0.6 0.23]);
           if (tip==1)|(tip==2)|(tip==5)|(tip==6)|(tip==7)|(tip==9)
               semilogx(f,h,'r',flim,1./sqrt(2),'bo','LineWidth',2);
           else
           semilogx(f,h,'r',fmin,1./sqrt(2),'bo',fmax,1/sqrt(2),'bo','LineWidth',2);%%grafic cu scara semi-logaritmica
%  fmin, 1./sqrt(2), 'bo': Adaugă un punct albastru ('bo') pe grafic la frecvența fmin cu o valoare corespunzătoare de 1/sqrt(2).
% fmax, 1/sqrt(2), 'bo': Adaugă încă un punct albastru ('bo') pe grafic la frecvența fmax cu o valoare corespunzătoare de 1/sqrt(2).
% 'LineWidth',2: Specifică lățimea liniei graficului ca fiind 2.
           end
           grid on;
           xlabel('Frecventa [ Hz ]');
           ylabel('| U2 / U1 | ');
           %ylim([0,1.2]);
           title(Titlul,'Fontweight','b','FontSize',14,'Color','r');
           legend(' |U2 / U1 |');
    subplot('Position', [0.35 0.4 0.6 0.23]);
                      if (tip==1)|(tip==2)|(tip==5)|(tip==6)|(tip==7)|(tip==9)
           semilogx(f,gain,'g',flim,-3,'ko','LineWidth',2);
                      else
                          if (tip==4)
                              gainAtResonance = interp1(f, gain, f0, 'spline');
                                semilogx(f,gain,'g',fmin,-3,'ko',fmax,-3,'ko',f0,gainAtResonance,'ro','LineWidth',2); 
                          else
           semilogx(f,gain,'g',fmin,-3,'ko',fmax,-3,'ko',f0,0,'ro','LineWidth',2);
                          end
                      end
           grid on;
           xlabel('Frecventa [ Hz ]');
           ylabel('Castigul [ dB ]');
           %ylim([-40,3]);
           title('Castigul','fontweight','b');
           legend('Castigul');
   %-----------------------------------------------------        
           subplot('Position', [0.35 0.07 0.6 0.23]);
                              if  (tip==1)|(tip==2)|(tip==5)|(tip==6)|(tip==7)|(tip==9)
           semilogx(f,phase,'b',flim,faza1,'ko','LineWidth',2);
                                 else
           semilogx(f,phase,'b',fmin,faza1,'ro',fmax,faza2,'ro','LineWidth',2);
                                 end
           grid on;
           xlabel('Frecventa [ Hz ]');
           ylabel('Faza [ grade ]');
           title('Faza semnalului','Fontweight','b');
           legend('Faza');
           
f = 50; 
T = 1 / f ;
N = 3;
A = 4;
if (alegere == 1)
    interfata2(f, T, N, A, h, phase);
end

if tipr==1
     uicontrol('Style','PopupMenu',...
           'Units','normalized',...
           'Position',[0.03 0.07 0.05 0.05],...
           'value',valr,...
           'String','10|15|22|33|47|68',...
           'FontSize',10,...
           'ForegroundColor','b',...
           'Tag','pop_up_menur',...
           'Callback','calcul_plot');
              if valr == 1
               R = 10;
                % set(Rb, 'String', num2str(R)); % Set the 'String' property to the new value
              end
               if valr == 2
               R = 15;
                % set(Rb, 'String', num2str(R)); % Set the 'String' property to the new valu
               end
                if valr == 3
               R = 22;
                % set(Rb, 'String', num2str(R)); % Set the 'String' property to the new value
              end
               if valr == 4
               R = 33;
               % set(Rb, 'String', num2str(R)); % Set the 'String' property to the new value
               end
                if valr == 5
               R = 47;
                % set(Rb, 'String', num2str(R)); % Set the 'String' property to the new value
                end
               if valr == 6
               R = 68;
               % set(Rb, 'String', num2str(R)); % Set the 'String' property to the new value
               end

end
if tipr == 2
    
     uicontrol('Style','PopupMenu',...
           'Units','normalized',...
           'Position',[0.03 0.07 0.05 0.05],...
           'value',valr,...
           'String','10|12|15|18|22|27|33|39|47|56|68|82',...
           'FontSize',10,...
           'ForegroundColor','b',...
           'Tag','pop_menu_r',...
           'Callback','calcul_plot');

end
if tipr == 3
     uicontrol('Style','PopupMenu',...
           'Units','normalized',...
           'Position',[0.03 0.07 0.05 0.05],...
           'value',valr,...
           'String','10|11|12|13|15|16|18|20|22|24|27|27|30|33|36|39|43|47|51|56|62|68|75|82|91',...
           'FontSize',10,...
           'ForegroundColor','b',...
           'Tag','pop_menu_r',...
           'Callback','calcul_plot');
end
if tipr == 4
     uicontrol('Style','PopupMenu',...
           'Units','normalized',...
           'Position',[0.03 0.07 0.05 0.05],...
           'value',valr,...
           'String','100|105|110|115|121|127|133|140|147|154|162|169|178|187|196|205|215|226|237|249|261|274|287|301|316|332|348|365|383|402|422|442|464|487|511|536|562|590|619|649|681|715|750|787|825|866|909|953',...
           'FontSize',10,...
           'ForegroundColor','b',...
           'Tag','pop_menu_r',...
           'Callback','calcul_plot');
end
if tipr == 5
     uicontrol('Style','PopupMenu',...
           'Units','normalized',...
           'Position',[0.03 0.07 0.05 0.05],...
           'value',valr,...
           'String','10|15|22|33|47|68',...
           'FontSize',10,...
           'ForegroundColor','b');
           % 'Tag','pop_menu_sr',...
           % 'Callback','calcul_plot');
end
if tipr == 6
     uicontrol('Style','PopupMenu',...
           'Units','normalized',...
           'Position',[0.03 0.07 0.03 0.05],...
           'value',valr,...
           'String','10|15|22|33|47|68',...
           'FontSize',10,...
           'ForegroundColor','b');
           % 'Tag','pop_menu_sr',...
           % 'Callback','calcul_plot');
end
