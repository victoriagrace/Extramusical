function type = Story_Type(surveyNum, songNum)

survey1=[3 4 4 1 1 3 4 3 2 1 2 2]';
survey2=[4 3 1 2 1 2 3 1 2 3 4 4]';
survey3=[2 3 3 4 1 3 2 4 1 2 1 4]';
lookupT=[survey1 survey2 survey3];

type=lookupT(songNum,surveyNum); 
%story type 1 = human composed
%story type 2 = human data sonification
%story type 2 = nature data sonification
%story type 3 = machine algorithm