x = 2:1:50;
y = 2:1:50;

[bits,inputs] = meshgrid(x,y);

es_naive = 0.5 + 2.^(-(bits+1)) + 2.^(-bits.*(inputs+1));
figure(1)
surf(es_naive)
colormap(jet)
xlabel('Bit resolution')
ylabel('Number of inputs')
%zlabel('Improvement over traditional DSC')
title('Expected number of cycles for naive ES as a fraction of traditional DSC')

%es_imp = (2.^(-2.*bits.*inputs)).*(2)

%figure(2)
%surf(es_imp)
%colormap(jet)
