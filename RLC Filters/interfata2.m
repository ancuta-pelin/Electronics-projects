function interfata2(f, T, N, A, h, phase)
t= 0 : T/100: N*T;
vi = A * sin( 2 * pi * f * t);
index1 = length (h);
index2 = length (phase);
v0 = h(index1) * A * sin( 2 * pi * f * t + phase(index2));
%vo = zeros(length(t));
Fig=figure('Name','Grafic intrare iesire',...
           'Units','normalized',...
           'Position',[0.3 0.3 0.5 0.5],...
           'Color','w',...
           'NumberTitle','off');
Atext=uicontrol('Style','text',...
                'Units','normalized',...
                'Position',[0.2 0.8 0.15 0.05],...
                'BackgroundColor','w',...
                'FontSize',12,...
                'FontWeight','b',...
                'String', 'Amplitudine');
A=uicontrol('Style','edit',...
            'Units','normalized',...
            'Position',[0.25 0.75 0.05 0.05],...
            'String', A,...
            'BackgroundColor',[0.75 0.75 0.75],...
            'FontWeight','b',...
            'Callback','A=str2num(get(gco,''string'')); close; interfata2(f, T, N, A, h, phase)');
ftext=uicontrol('Style','text',...
                'Units','normalized',...
                'Position',[0.2 0.65 0.15 0.05],...
                'BackgroundColor','w',...
                'FontSize',12,...
                'FontWeight','b',...
                'String', 'Frecventa');
f=uicontrol('Style','edit',...
            'Units','normalized',...
            'Position',[0.25 0.6 0.05 0.05],...
            'String', f,...
            'BackgroundColor',[0.75 0.75 0.75],...
            'FontWeight','b',...
            'Callback','f=str2num(get(gco,''string'')); close; interfata2(f, T, N, A, h, phase)');
Ntext=uicontrol('Style','text',...
                'Units','normalized',...
                'Position',[0.2 0.5 0.15 0.05],...
                'BackgroundColor','w',...
                'FontSize',12,...
                'FontWeight','b',...
                'String', 'Numar de perioade');
N=uicontrol('Style','edit',...
            'Units','normalized',...
            'Position',[0.25 0.45 0.05 0.05],...
            'String', N,...
            'BackgroundColor',[0.75 0.75 0.75],...
            'FontWeight','b',...
            'Callback','N=str2num(get(gco,''string'')); close; interfata2(f, T, N, A, h, phase)');
htext=uicontrol('Style','text',...
                'Units','normalized',...
                'Position',[0.2 0.35 0.17 0.05],...
                'BackgroundColor','w',...
                'FontSize',12,...
                'FontWeight','b',...
                'String', '|H|');
N=uicontrol('Style','edit',...
            'Units','normalized',...
            'Position',[0.25 0.3 0.07 0.05],...
            'String', h(index1),...
            'BackgroundColor',[0.75 0.75 0.75],...
            'FontWeight','b',...
            'Callback','h(index1)=str2num(get(gco,''string'')); close; interfata2(f, T, N, A, h, phase)');
htext=uicontrol('Style','text',...
                'Units','normalized',...
                'Position',[0.2 0.2 0.17 0.05],...
                'BackgroundColor','w',...
                'FontSize',12,...
                'FontWeight','b',...
                'String', 'Faza');
N=uicontrol('Style','edit',...
            'Units','normalized',...
            'Position',[0.25 0.15 0.07 0.05],...
            'String', phase(index2),...
            'BackgroundColor',[0.75 0.75 0.75],...
            'FontWeight','b',...
            'Callback','phase(index2)=str2num(get(gco,''string'')); close; interfata2(f, T, N, A, h, phase)');


subplot('Position', [0.5, 0.5, 0.4, 0.3]);
plot(t,vi,'-r'); %afisam primul sinus 
grid on;
hold on; %il mentinem pe axe
plot(t,v0,'-b'); %afisam al doilea sinus
Title = 'Reprezentare Ui si Uo';

xlabel('Timp [ s ]');
ylabel('| Uin, Uo | ');
title(Title,'Fontweight','b','FontSize',14,'Color','r');
legend('Ui-linia rosie','Uo-linia albastra'); 
