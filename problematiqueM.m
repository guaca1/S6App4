load('homme.mat')
load('sortiecapteur.mat')

OndeCarree = 12*[zeros(length(SortieCapteur)*3,1) ; square(linspace(0,2*pi*48000*600, 48000))'];
OndeCarree = [(0:1/48000:(length(OndeCarree)-1)/48000)' OndeCarree];
gainCapteur = 12./max(abs(SortieCapteur(:,2)));


Pmoy = sum((gainCapteur*SortieCapteur(:,2)).^2)/length(SortieCapteur);
PmoyCanalAnal = sum((entreeCanalAnal(1:64000)).^2)/length(entreeCanalAnal(1:64000));
dS = sqrt(Pmoy*12/10^4.5);
niveau = 24/dS;
N = ceil(log2(niveau))
y=audioplayer(AudioOut/max(AudioOut), 16000);
%histogram(ADCOut);
yanal = audioplayer(AudioOutAnal/max(AudioOutAnal), 16000)

%10*log10(sum(signalAnal(1:64000).^2)/sum(bruitAnal(1:64000).^2))