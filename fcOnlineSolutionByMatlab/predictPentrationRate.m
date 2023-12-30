
sub = rankPenetratrationRate;
num_samples = 1000;

X = sub; % 독립변수
Y1 = penLongPassTry; % 종속변수 1
Y2 = penShortPassTry; % 종속변수 2
Y3 = penPassTry; % 종속변수 3
Y4 = penHeadingShoot; % 종속변수 4
Y5 = penShootInPenalty; % 종속변수 5
Y6 = penTackleTry; % 종속변수 6

% 다변량 선형 회귀 모델 학습
X_augmented = [ones(num_samples, 1), X]; % 상수항을 추가
B1 = regress(Y1, X_augmented);
B2 = regress(Y2, X_augmented);
B3 = regress(Y3, X_augmented);
B4 = regress(Y4, X_augmented);
B5 = regress(Y5, X_augmented);
B6 = regress(Y6, X_augmented);

% 모델을 사용하여 새로운 데이터에 대한 예측
newX = linspace(min(X), max(X), num_samples)';
newX_augmented = [ones(num_samples, 1), newX];
predictedY1 = newX_augmented * B1;
predictedY2 = newX_augmented * B2;
predictedY3 = newX_augmented * B3;
predictedY4 = newX_augmented * B4;
predictedY5 = newX_augmented * B5;
predictedY6 = newX_augmented * B6;

% 시각화
figure;

% 원하는 독립 변수 값 입력
desiredX = 0.4; % 원하는 값 입력

subplot(6, 1, 1);
scatter(X, Y1, 'o');
hold on;
plot(newX, predictedY1, '-r', 'LineWidth', 2);
title('LongPassTry 예측');

% 모델을 사용하여 원하는 독립 변수 값에 대한 예측
desiredY1 = [1, desiredX] * B1;

scatter(desiredX, desiredY1, 's', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'k');
text(desiredX, desiredY1, ['(', num2str(desiredX), ', ', num2str(desiredY1), ')']);

subplot(6, 1, 2);
scatter(X, Y2, 'o');
hold on;
plot(newX, predictedY2, '-b', 'LineWidth', 2);
title('ShortPassTry 예측');

% 모델을 사용하여 원하는 독립 변수 값에 대한 예측
desiredY2 = [1, desiredX] * B2;

scatter(desiredX, desiredY2, 's', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'k');
text(desiredX, desiredY2, ['(', num2str(desiredX), ', ', num2str(desiredY2), ')']);

subplot(6, 1, 3);
scatter(X, Y3, 'o');
hold on;
plot(newX, predictedY3, '-g', 'LineWidth', 2);
title('PassTry 예측');

% 모델을 사용하여 원하는 독립 변수 값에 대한 예측
desiredY3 = [1, desiredX] * B3;

scatter(desiredX, desiredY3, 's', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'k');
text(desiredX, desiredY3, ['(', num2str(desiredX), ', ', num2str(desiredY3), ')']);

subplot(6, 1, 4);
scatter(X, Y4, 'o');
hold on;
plot(newX, predictedY4, '-c', 'LineWidth', 2);
title('HeadingShoot 예측');

% 모델을 사용하여 원하는 독립 변수 값에 대한 예측
desiredY4 = [1, desiredX] * B4;

scatter(desiredX, desiredY4, 's', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'k');
text(desiredX, desiredY4, ['(', num2str(desiredX), ', ', num2str(desiredY4), ')']);

subplot(6, 1, 5);
scatter(X, Y5, 'o');
hold on;
plot(newX, predictedY5, '-m', 'LineWidth', 2);
title('ShootInPenalty 예측');

% 모델을 사용하여 원하는 독립 변수 값에 대한 예측
desiredY5 = [1, desiredX] * B5;

scatter(desiredX, desiredY5, 's', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'k');
text(desiredX, desiredY5, ['(', num2str(desiredX), ', ', num2str(desiredY5), ')']);

subplot(6, 1, 6);
scatter(X, Y6, 'o');
hold on;
plot(newX, predictedY6, '-y', 'LineWidth', 2);
title('TackleTry 예측');

% 모델을 사용하여 원하는 독립 변수 값에 대한 예측
desiredY6 = [1, desiredX] * B6;

scatter(desiredX, desiredY6, 's', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'k');
text(desiredX, desiredY6, ['(', num2str(desiredX), ', ', num2str(desiredY6), ')']);

xlabel('독립변수');
ylabel('종속변수');
legend('실제 데이터', '예측');