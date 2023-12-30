
sub = rankdribbleRate;
num_samples = 1000;

X = sub; % 독립변수
Y1 = driShootOutPenalty; % 종속변수 1
Y2 = driPassTry; % 종속변수 2
Y3 = driPossession; % 종속변수 3


% 다변량 선형 회귀 모델 학습
X_augmented = [ones(num_samples, 1), X]; % 상수항을 추가
B1 = regress(Y1, X_augmented);
B2 = regress(Y2, X_augmented);
B3 = regress(Y3, X_augmented);


% 모델을 사용하여 새로운 데이터에 대한 예측
newX = linspace(min(X), max(X), num_samples)';
newX_augmented = [ones(num_samples, 1), newX];
predictedY1 = newX_augmented * B1;
predictedY2 = newX_augmented * B2;
predictedY3 = newX_augmented * B3;


% 시각화
figure;

% 원하는 독립 변수 값 입력
desiredX = 0.9; % 원하는 값 입력

subplot(3, 1, 1);
scatter(X, Y1, 'o');
hold on;
plot(newX, predictedY1, '-r', 'LineWidth', 2);
title('ShootOutPenalty 예측');

% 모델을 사용하여 원하는 독립 변수 값에 대한 예측
desiredY1 = [1, desiredX] * B1;

scatter(desiredX, desiredY1, 's', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'k');
text(desiredX, desiredY1, ['(', num2str(desiredX), ', ', num2str(desiredY1), ')']);

subplot(3, 1, 2);
scatter(X, Y2, 'o');
hold on;
plot(newX, predictedY2, '-b', 'LineWidth', 2);
title('PassTry 예측');

% 모델을 사용하여 원하는 독립 변수 값에 대한 예측
desiredY2 = [1, desiredX] * B2;

scatter(desiredX, desiredY2, 's', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'k');
text(desiredX, desiredY2, ['(', num2str(desiredX), ', ', num2str(desiredY2), ')']);

subplot(3, 1, 3);
scatter(X, Y3, 'o');
hold on;
plot(newX, predictedY3, '-g', 'LineWidth', 2);
title('Possession 예측');

% 모델을 사용하여 원하는 독립 변수 값에 대한 예측
desiredY3 = [1, desiredX] * B3;

scatter(desiredX, desiredY3, 's', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'k');
text(desiredX, desiredY3, ['(', num2str(desiredX), ', ', num2str(desiredY3), ')']);

xlabel('독립변수');
ylabel('종속변수');
legend('실제 데이터', '예측');