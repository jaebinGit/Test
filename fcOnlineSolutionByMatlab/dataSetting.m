

longPassTry = matchData(:,1);
throughPassTry = matchData(:,2);
shortPassTry = matchData(:,3);
dribbleTry = matchData(:,4);
shootOutPenalty = matchData(:,5);
passTry = matchData(:,6);
crossRate = longPassTry./passTry;
penetrationRate = throughPassTry./passTry;
tikitakaRate = shortPassTry./passTry;
dribbleRate = dribbleTry./passTry;
shootTotal = matchData(:,8);
midRangeShootRate = shootOutPenalty./shootTotal;

% 원본 데이터 출력
data = crossRate;
% 내림차순 정렬
[sortedData, sortedIndices] = sort(data, 'descend');
% 정렬된 순위(인덱스) 출력
rank(:,1) = sortedIndices;
% 원본 데이터 출력
data = dribbleRate;
% 내림차순 정렬
[sortedData, sortedIndices] = sort(data, 'descend');
% 정렬된 순위(인덱스) 출력
rank(:,2) = sortedIndices;
% 원본 데이터 출력
data = midRangeShootRate;
% 내림차순 정렬
[sortedData, sortedIndices] = sort(data, 'descend');
% 정렬된 순위(인덱스) 출력
rank(:,3) = sortedIndices;
% 원본 데이터 출력
data = penetrationRate;
% 내림차순 정렬
[sortedData, sortedIndices] = sort(data, 'descend');
% 정렬된 순위(인덱스) 출력
rank(:,4) = sortedIndices;
% 원본 데이터 출력
data = tikitakaRate;
% 내림차순 정렬
[sortedData, sortedIndices] = sort(data, 'descend');
% 정렬된 순위(인덱스) 출력
rank(:,5) = sortedIndices;

rowsToRemove = [1:10];
% 논리 인덱싱을 사용하여 특정 행 제거
rank = rank(setdiff(1:size(rank, 1), rowsToRemove), :);


% rankResult 초기화 (비어 있는 행렬)
crossRankResult = [];
% 각 행에 대해 rank 행렬의 인덱스를 사용하여 matchData의 데이터를 추출하여 rankResult에 추가
for i = 1:1000
indices = rank(i, 1);  % 현재 행의 인덱스
rowData = matchData(indices, :);  % matchData에서 해당 인덱스에 해당하는 데이터 추출
crossRankResult = [crossRankResult; rowData];  % rankResult에 데이터 추가
end
% rankResult 초기화 (비어 있는 행렬)
dribbleRankResult = [];
% 각 행에 대해 rank 행렬의 인덱스를 사용하여 matchData의 데이터를 추출하여 rankResult에 추가
for i = 1:1000
indices = rank(i, 2);  % 현재 행의 인덱스
rowData = matchData(indices, :);  % matchData에서 해당 인덱스에 해당하는 데이터 추출
dribbleRankResult = [dribbleRankResult; rowData];  % rankResult에 데이터 추가
end
% rankResult 초기화 (비어 있는 행렬)
midRangeShootRankResult = [];
% 각 행에 대해 rank 행렬의 인덱스를 사용하여 matchData의 데이터를 추출하여 rankResult에 추가
for i = 1:1000
indices = rank(i, 3);  % 현재 행의 인덱스
rowData = matchData(indices, :);  % matchData에서 해당 인덱스에 해당하는 데이터 추출
midRangeShootRankResult = [midRangeShootRankResult; rowData];  % rankResult에 데이터 추가
end
% rankResult 초기화 (비어 있는 행렬)
penetrationRankResult = [];
% 각 행에 대해 rank 행렬의 인덱스를 사용하여 matchData의 데이터를 추출하여 rankResult에 추가
for i = 1:1000
indices = rank(i, 4);  % 현재 행의 인덱스
rowData = matchData(indices, :);  % matchData에서 해당 인덱스에 해당하는 데이터 추출
penetrationRankResult = [penetrationRankResult; rowData];  % rankResult에 데이터 추가
end
% rankResult 초기화 (비어 있는 행렬)
tikitakaRankResult = [];
% 각 행에 대해 rank 행렬의 인덱스를 사용하여 matchData의 데이터를 추출하여 rankResult에 추가
for i = 1:1000
indices = rank(i, 5);  % 현재 행의 인덱스
rowData = matchData(indices, :);  % matchData에서 해당 인덱스에 해당하는 데이터 추출
tikitakaRankResult = [tikitakaRankResult; rowData];  % rankResult에 데이터 추가
end