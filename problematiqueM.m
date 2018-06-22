load('homme.mat')
load('sortiecapteur.mat')

OndeCarree = 12*[zeros(length(SortieCapteur)*3,1) ; square(linspace(0,2*pi*48000*600, 48000))'];
OndeCarree = [(0:1/48000:(length(OndeCarree)-1)/48000)' OndeCarree];
gainCapteur = 12./max(abs(SortieCapteur(:,2)));
