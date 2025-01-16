[x, fs] = audioread('azdokonca.mp3'); %piosenka kolegi do testu 
[x1,fs1] = audioread("testaudio.m4a"); %głosówka z dyktafonu
[x2,fs2] = audioread("20hztest.mp3"); %test dźwięku o niskiej częstotliwości
[x3,fs3] = audioread("20khztest.mp3"); %test dźwięku o wysokiej częstotliwości

N = length(x); %długość wektora x 
t = (0:N-1) / fs; %wektor czasu 
if size(x, 2) > 1 %sprawdzenie czy kanał jest mono czy stereo 
    x = x(:,1);
end

N1= length(x1);
t1 = (0:N1-1) / fs1;
if size(x1, 2) > 1
    x1 = x1(:,1);
end

N2= length(x2);
t2 = (0:N2-1) / fs2;
if size(x2, 2) > 1
    x2 = x2(:,1);
end


N3= length(x3);
t3 = (0:N3-1) / fs3;
if size(x3, 2) > 1
    x3 = x3(:,1);
end

S = fft(x); %transformata Fouriera z danego sygnału 
S = S(1:N/2); %wybieramy wartości dodatnie do wykresu (widmo jednostronne)
f = fs * (0:N/2-1) / N; %obliczanie częstotliwości jako iloczyn próbek i czestotliwości próbkowania
s = 2 * abs(S) / N; %amplitudy widm jednostronnych 

S1 = fft(x1);
S1 = S1(1:N1/2);
f1 = fs1 * (0:N1/2-1) / N1;
s1 = 2 * abs(S1) / N1;

S2 = fft(x2);
S2 = S2(1:N2/2);
f2 = fs2 * (0:N2/2-1) / N2;
s2 = 2 * abs(S2) / N2;

S3 = fft(x3);
S3 = S3(1:N3/2);
f3 = fs3 * (0:N3/2-1) / N3;
s3 = 2 * abs(S3) / N3;
%wykresy dla dzwieku numer 1
figure
subplot(4,1,1);
plot(t, x, 'g'); %dziedzina czasu 
xlabel('Czas (s)');
ylabel('Amplituda');
title('Analiza sygnału audio - piosenki w dziedzinie czasu');
subplot(4,1,2);
plot(f, s, 'b');  %dziedzina czestotliwosci 
xlabel('Częstotliwość (10kHz)');
ylabel('Amplituda');
title('Analiza sygnału audio - piosenki w dziedzinie częstotliwości');
subplot(4,1,3);
spectrogram(x, 1024, 512, 1024, fs, 'yaxis');   %spektogram 
title("Spektrogram piosenki");
xlabel("Czas (s)");
ylabel("Częstotliwość (10kHz)");
subplot(4,1,4);
histogram(x); %histogram
title("Histogram piosenki")

%wykresy dla dźwięku numer 2 (analogicznie jak w 1)
figure
subplot(4,1,1);
plot(t1, x1, 'g');
xlabel('Czas (s)');
ylabel('Amplituda');
title('Sygnał audio - nagranie z dyktafonu w dziedzinie czasu');
subplot(4,1,2);
plot(f1, s1, 'b');
xlabel('Częstotliwość (kHz)');
ylabel('Amplituda');
title('Sygnał audio - nagranie z dyktafonu w dziedzinie częstotliwości');
subplot(4,1,3);
spectrogram(x1, 1024, 512, 1024, fs1, 'yaxis');
title("Spektrogram sygnału - nagrania z dyktafonu");
xlabel("Czas (s)");
ylabel("Częstotliwość (10kHz)");
subplot(4,1,4);
histogram(x1);
title("Histogram sygnału audio - nagrania z dyktafonu")
%wykresy dla dźwięku numer 3 
figure
subplot(4,1,1);
plot(t2, x2, 'g');
xlabel('Czas (s)');
ylabel('Amplituda');
title('Sygnał audio o częstotliwości 20Hz w dziedzinie czasu');
subplot(4,1,2);
plot(f2, s2, 'b');
xlabel('Częstotliwość (10kHz)');
ylabel('Amplituda');
title('Sygnał audio o czestotliwosci 20Hz w dziedzinie częstotliwości');
subplot(4,1,3);
spectrogram(x2, 1024, 512, 1024, fs2, 'yaxis');
title("Spektrogram sygnału audio o częstotliwości 20Hz");
xlabel("Czas (s)");
ylabel("Częstotliwość (10kHz)");
subplot(4,1,4);
histogram(x2);
title("Histogram sygnału audio o częstotliwości 20Hz")
%wykresy dla dźwięku numer 4
figure
subplot(4,1,1);
plot(t3, x3, 'g');
xlabel('Czas (s)');
ylabel('Amplituda');
title('Sygnał audio - dzwięk o częstotliwosci 20kHz w dziedzinie czasu');
subplot(4,1,2);
plot(f3, s3, 'b');
xlabel('Częstotliwość (10kHz)');
ylabel('Amplituda');
title('Sygnał audio - dżwięk o częstotliwości 20kHz w dziedzinie częstotliwości');
subplot(4,1,3);
spectrogram(x3, 1024, 512, 1024, fs3, 'yaxis');
title("Spektrogram sygnału audio o częstotliwosci 20kHz");
xlabel("Czas (s)");
ylabel("Częstotliwość (10kHz)");
subplot(4,1,4);
histogram(x3);
title("Histogram sygnału audio o częstotliwości 20kHz")