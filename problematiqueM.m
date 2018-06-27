load('homme.mat')
load('sortiecapteur.mat')

%Initialisation de l'onde carr
OndeCarree = 12*[zeros(length(SortieCapteur)*3,1) ; square(linspace(0,2*pi*48000*600, 48000))'];
OndeCarree = [(0:1/48000:(length(OndeCarree)-1)/48000)' OndeCarree];


%Niveau de quantification
gainCapteur = 12./max(abs(SortieCapteur(:,2)));
Pmoy = sum((gainCapteur*SortieCapteur(:,2)).^2)/length(SortieCapteur);
dS = sqrt(Pmoy*12/10^4.5);
niveau = 24/dS;
N = ceil(log2(niveau))

%lecture des fichiers audio
y=audioplayer(AudioOut/max(AudioOut), 16000);

yanal = audioplayer(AudioOutAnal/max(AudioOutAnal), 16000)
PmoyCanalAnal = sum((entreeCanalAnal(1:64000)).^2)/length(entreeCanalAnal(1:64000));

%histogram
figure
hold on
set(gca, 'YScale', 'log')
title('Histogramme du signal envoyé par le capteur')
ylabel({'Nombre de valeur','(dB)'})
xlabel('Valeur')
histogram(SortieCapteur(:,2))
figure 
hold on
set(gca, 'YScale', 'log')
title('Histogramme du signal après le companding')
ylabel({'Nombre de valeur','(dB)'})
xlabel('Valeur')
histogram(AudioOut(1:64000))
%10*log10(sum(signalAnal(1:64000).^2)/sum(bruitAnal(1:64000).^2))