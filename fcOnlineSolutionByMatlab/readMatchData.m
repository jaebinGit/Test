%% 스프레드시트에서 데이터 가져오기
% 다음 스프레드시트에서 데이터를 가져오기 위한 스크립트:
%
%    통합 문서: /MATLAB Drive/fifaSolution/matchData.xlsx
%    워크시트: Sheet1
%
% MATLAB에서 03-Dec-2023 00:42:20에 자동 생성됨

%% 가져오기 옵션을 설정하고 데이터 가져오기
opts = spreadsheetImportOptions("NumVariables", 12);

% 시트와 범위 지정
opts.Sheet = "Sheet1";
opts.DataRange = "A2:L9755";

% 열 이름과 유형 지정
opts.VariableNames = ["Var1", "Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10", "Var11", "Var12"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double"];

% 데이터 가져오기
matchData = readtable("/MATLAB Drive/fifaSolution/matchData.xlsx", opts, "UseExcel", false);

%% 출력 유형으로 변환
matchData = table2array(matchData);

%% 임시 변수 지우기
clear opts