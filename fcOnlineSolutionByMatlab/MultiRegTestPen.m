% 데이터 설정
sub = rankPenetratrationRate;
ind = [
    penLongPassTry';
    penShortPassTry';
    %penDirrble';
    %penShootOutPenalty';
    penPassTry';
    %penPossession';
    %penShootTotal';
    %penGoalTotal';
    penHeadingShoot';
    penShootInPenalty';
    penTackleTry'
]';

% 첫 번째 행을 선택하여 하나의 벡터로 변환
sub_modified = sub(:, 1);

% 다변량 회귀 분석
mdl = fitlm(ind, sub_modified);

% 회귀 모델 예측
predicted = predict(mdl, ind);

% 산점도 그리기
scatter(sub_modified, predicted);
xlabel('실제 값');
ylabel('예측 값');
title('다변량 회귀 분석 결과: 실제 값 vs. 예측 값');

disp(mdl);