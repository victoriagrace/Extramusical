%Generates histogram showing responses per song
close all
survey=survey1800;
% survey=surveyall;

k=1

dataSize=size(survey)
rows=dataSize(1,1);
cols= dataSize(1,2);
 

%survey2=cat(2,survey(:,4),survey(:,5),survey(:,6),survey(:,23),survey(:,24),survey(:,39),survey(:,40),survey(:,21),survey(:,22),survey(:,19),survey(:,20),survey(:,25),survey(:,26),survey(:,17),survey(:,18),survey(:,29),survey(:,30),survey(:,37),survey(:,38),survey(:,31),survey(:,32),survey(:,27),survey(:,28),survey(:,35),survey(:,36),survey(:,33),survey(:,34))
%%
varList=[];
stdList=[];
songResponses=[];

        %reorder and trim array 
        if k==1
survey2=cat(2,survey(:,4),survey(:,5),survey(:,6),survey(:,23),survey(:,24),...
    survey(:,39),survey(:,40),survey(:,21),survey(:,22),survey(:,19),survey(:,20),...
    survey(:,25),survey(:,26),survey(:,17),survey(:,18),survey(:,29),survey(:,30),...
    survey(:,37),survey(:,38),survey(:,31),survey(:,32),survey(:,27),survey(:,28),...
    survey(:,35),survey(:,36),survey(:,33),survey(:,34))
        end
        if k ==2
            survey2=cat(2,survey(:,4),survey(:,5),survey(:,6),survey(:,25),survey(:,26),...
    survey(:,29),survey(:,30),survey(:,17),survey(:,18),survey(:,35),survey(:,36),...
    survey(:,39),survey(:,40),survey(:,23),survey(:,24),survey(:,33),survey(:,34),...
    survey(:,31),survey(:,32),survey(:,27),survey(:,28),survey(:,19),survey(:,20),...
    survey(:,21),survey(:,22),survey(:,37),survey(:,38))
        end
        if k==3
            survey2=cat(2,survey(:,4),survey(:,5),survey(:,6),survey(:,19),survey(:,20),...
    survey(:,35),survey(:,26),survey(:,39),survey(:,40),survey(:,25),survey(:,26),...
    survey(:,33),survey(:,34),survey(:,29),survey(:,30),survey(:,27),survey(:,28),...
    survey(:,23),survey(:,24),survey(:,37),survey(:,38),survey(:,21),survey(:,22),...
    survey(:,17),survey(:,18),survey(:,31),survey(:,32))
        end
        
stdAll=zeros(1,12);
        
for s=1:1:12
newArray=[];

%    s=1;
 
 col = FindSongCol(s)
 col = col-1;

 happy=0;
 playful=0;
 tranquil=0;
 nostalgic=0;
 sad=0;
 spiritual=0;
 angry=0;
 exciting=0;
 

for i=1:1:rows
answer = survey2{i,col+1};

 switch answer
        case {'Angry, Tragic, Restless, Tense, Anxious, Agitated'}
            angry=angry+1;
        case {'Playful, Light, Graceful, Humorous, Quaint, Merry'}
            playful=playful+1;
        case {'Tranquil, Peaceful, Gentle, Serene, Comforting, Tender, Graceful, Calm'}
            tranquil=tranquil+1;
        case {'Nostalgic, Sentimental, Dreamy, Touching, Longing'}
              nostalgic=nostalgic+1;
        case {'Sad, Depressing, Gloomy, Dark, Mournful'}
            sad=sad+1;
        case {'Spiritual, Sublime, Sacred, Serious, Awe-inspiring'}
             spiritual=spiritual+1;
        case {'Happy, Joyous, Cheerful, Bright, Sunny, Fun'}
            happy=happy+1;
        case {'Exciting, Passionate, Tumultuous, Exhilarated, Soaring'}
             exciting=exciting+1;
        end

end
emotionNum= [happy, playful, tranquil, nostalgic, sad, spiritual, angry, exciting];
emotionNum7= [happy+playful, tranquil, nostalgic, sad, spiritual, angry, exciting];

[sortE, index]= sort(emotionNum7, 'descend');


emotionCat={'Happy',  'Tranquil', 'Nostalgic', 'Sad', 'Spiritual', 'Angry', 'Exciting'}
emotionCatOrder=emotionCat(:,index); %reorders string names to keep track of corresponding emotionNum

disNum= [0 -1 1 -2 2 -3 3];

[x i]= sort(disNum);
dis=sortE(:,i)
emotionCatReorder = emotionCatOrder(:,i);


for h=1:1:7 
    
repeatNum=sortE(h);
arrayChunk=repmat(disNum(h),[1,repeatNum]);
newArray=[newArray arrayChunk];

end
% newArray=newArray';
% songResponses=[songResponses;arrayChunk];

arrayVar=var(newArray);
arrayStd=std(newArray);
stdAll(s) = arrayStd;

varList=[varList arrayVar];
stdList=[stdList arrayStd];
csvwrite('dataCount.csv',newArray)
newArray
stdList
% plot(x,dis,'*')
figure(s)
histogram('Categories',emotionCatReorder,'BinCounts',dis);
title(['Song #' num2str(s) '   SD =' num2str(stdList(s))])
%



 %reoder
%  figure(s);
%  histogram('Categories',{'Happy','Playful','Tranquil','Nostalgic','Sad','Spiritual','Angry','Exciting'},'BinCounts',emotionNum)
%  title(['Song #'  num2str(s)])
%  xlabel('Emotion Catagory')
%  ylabel('Number of Responses')

 end
 