survey=survey1800;

dataSize=size(survey)
rows=dataSize(1,1);
cols= dataSize(1,2);

songNum = 2; % change this to select song
 
for s=1:1:12
     
 col = FindSongCol2(s)

 happy=0;
 playful=0;
 tranquil=0;
 nostalgic=0;
 sad=0;
 spiritual=0;
 angry=0;
 exciting=0;
 
for i=1:1:12
answer = survey{i,col};

 switch answer
        case {'Happy, Joyous, Cheerful, Bright, Sunny, Fun'}
            angry=angry+1;
        case 'Playful, Light, Graceful, Humorous, Quaint, Merry'
            playful=playful+1;
        case 'Tranquil, Peaceful, Gentle, Serene, Comforting, Tender, Graceful, Calm'
            tranquil=tranquil+1;
        case 'Nostalgic, Sentimental, Dreamy, Touching, Longing'
              nostalgic=nostalgic+1;
        case 'Sad, Depressing, Gloomy, Dark, Mournful'
            sad=sad+1;
        case 'Spiritual, Sublime, Sacred, Serious, Awe-inspiring'
             spiritual=spiritual+1;
        case 'Angry, Tragic, Restless, Tense, Anxious, Agitated'
            angry=angry+1;
        case 'Exciting, Passionate, Tumultuous, Exhilarated, Soaring'
             exciting=exciting+1;
        end

end
 emotionNum= [happy, playful, tranquil, nostalgic, sad, spiritual, angry, exciting]
 emotionCat={'Happy', 'Playful', 'Tranquil', 'Nostalgic', 'Sad', 'Spiritual', 'Angry', 'Exciting'}
 figure(s);
 histogram('Categories',{'Happy','Playful','Tranquil','Nostalgic','Sad','Spiritual','Angry','Exciting'},'BinCounts',emotionNum)
 title(['Song #'  num2str(s)])
end

 