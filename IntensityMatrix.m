
% Generates histogram showing number of correct responses per song in each
% survey
close all

storyN=4;
surveyN=3;
songN=12;
corCatN=3;

IntensityData = cell(storyN,surveyN,songN,corCatN);
ParticipantNum = cell(storyN,surveyN,songN,corCatN);

for k = 1:1:3
    
    switch k
        case 1
            survey=survey1800;
            %reorder and trim array
            survey2=cat(2,survey(:,4),survey(:,5),survey(:,6),survey(:,23),survey(:,24),...
                survey(:,39),survey(:,40),survey(:,21),survey(:,22),survey(:,19),survey(:,20),...
                survey(:,25),survey(:,26),survey(:,17),survey(:,18),survey(:,29),survey(:,30),...
                survey(:,37),survey(:,38),survey(:,31),survey(:,32),survey(:,27),survey(:,28),...
                survey(:,35),survey(:,36),survey(:,33),survey(:,34))
        case 2
            survey=survey2800;
            %reorder and trim array
            survey2=cat(2,survey(:,4),survey(:,5),survey(:,6),survey(:,25),survey(:,26),...
                survey(:,29),survey(:,30),survey(:,17),survey(:,18),survey(:,35),survey(:,36),...
                survey(:,39),survey(:,40),survey(:,23),survey(:,24),survey(:,33),survey(:,34),...
                survey(:,31),survey(:,32),survey(:,27),survey(:,28),survey(:,19),survey(:,20),...
                survey(:,21),survey(:,22),survey(:,37),survey(:,38))
        case 3
            survey=survey3800;
            %reorder and trim array
            survey2=cat(2,survey(:,4),survey(:,5),survey(:,6),survey(:,19),survey(:,20),...
                survey(:,35),survey(:,26),survey(:,39),survey(:,40),survey(:,25),survey(:,26),...
                survey(:,33),survey(:,34),survey(:,29),survey(:,30),survey(:,27),survey(:,28),...
                survey(:,23),survey(:,24),survey(:,37),survey(:,38),survey(:,21),survey(:,22),...
                survey(:,17),survey(:,18),survey(:,31),survey(:,32))
    end
    
    dataSize=size(survey)
    rows=dataSize(1,1);
    cols= dataSize(1,2);
    
    
    %
    
    %initialize variables to store number of correct values
    s1=0,s2=0,s3=0,s4=0,s5=0,s6=0,s7=0,s8=0,s9=0,s10=0,s11=0,s12=0;
    %intensities cell matrixes- I chose to specify the size instead of making
    %them all (3,1) so that we can tell if there are correct ones missing in
    %each survey
    s1i=cell(3,2),s2i=cell(3,2),s3i=cell(3,2),s4i=cell(3,2),s5i=cell(3,2),s6i=cell(3,2),s7i=cell(3,2),s8i=cell(3,2),s9i=cell(3,2),s10i=cell(3,2),s11i=cell(3,2),s12i=cell(3,2); %list of intensities
    
    
    for s=1:1:12
        
        col = FindSongCol(s) %use function to find correct column
        
        for i=1:1:rows
            answer = survey2{i,col}; % go through each row in a column and check
            
            
            if s==1
                switch answer
                    case {'Nostalgic, Sentimental, Dreamy, Touching, Longing'}
                        s1=s1+1;
                        s1i{1,1}=[s1i{1,1} survey2{i,col+1}]
                        s1i{1,2}=[s1i{1,2} i]

                        
                    case {'Tranquil, Peaceful, Gentle, Serene, Comforting, Tender, Graceful, Calm'}
                        s1=s1+1;
                        s1i{2,1}=[s1i{2,1} survey2{i,col+1}]
                        s1i{2,2}=[s1i{2,2} i]

                    case {'Sad, Depressing, Gloomy, Dark, Mournful'}
                        s1=s1+1;
                        s1i{3,1}=[s1i{3,1} survey2{i,col+1}]
                        s1i{3,2}=[s1i{3,2} i]

                end
                %stong intensities in intensityData Matrix
                IntensityData{Story_Type(k,s),k,s,1}=s1i{1,1}; %IntensityData{storyN,surveyN,songN,corCatN}
                IntensityData{Story_Type(k,s),k,s,2}=s1i{2,1};
                IntensityData{Story_Type(k,s),k,s,3}=s1i{3,1};
                
                ParticipantNum{Story_Type(k,s),k,s,1}=s1i{1,2}; %IntensityData{storyN,surveyN,songN,corCatN}
                ParticipantNum{Story_Type(k,s),k,s,2}=s1i{2,2};
                ParticipantNum{Story_Type(k,s),k,s,3}=s1i{3,2};  

            end
              
                
            if s== 2
                switch answer
                    case {'Sad, Depressing, Gloomy, Dark, Mournful'}
                        s2=s2+1;
                        s2i{1,1}=[s2i{1,1} survey2{i,col+1}]
                        s2i{1,2}=[s2i{1,2} i]

                    case {'Tranquil, Peaceful, Gentle, Serene, Comforting, Tender, Graceful, Calm'}
                        s2=s2+1;
                        s2i{2,1}=[s2i{2,1} survey2{i,col+1}]
                        s2i{2,2}=[s2i{2,2} i]

                    case {'Spiritual, Sublime, Sacred, Serious, Awe-inspiring'}
                        s2=s2+1;
                        s2i{3,1}=[s2i{3,1} survey2{i,col+1}];
                        s2i{3,2}=[s2i{3,2} i]

                end
                IntensityData{Story_Type(k,s),k,s,1}=s2i{1,1}; %IntensityData{storyN,surveyN,songN,corCatN}
                IntensityData{Story_Type(k,s),k,s,2}=s2i{2,1};
                IntensityData{Story_Type(k,s),k,s,3}=s2i{3,1};
                
               
                ParticipantNum{Story_Type(k,s),k,s,1}=s2i{1,2}; %IntensityData{storyN,surveyN,songN,corCatN}
                ParticipantNum{Story_Type(k,s),k,s,2}=s2i{2,2};
                ParticipantNum{Story_Type(k,s),k,s,3}=s2i{3,2};
            end
            if s== 3
                switch answer
                    case {'Angry, Tragic, Restless, Tense, Anxious, Agitated'}
                        s3=s3+1;
                        s3i{1,1}=[s3i{1,1} survey2{i,col+1}]
                        s3i{1,2}=[s3i{1,2} i]

                    case {'Sad, Depressing, Gloomy, Dark, Mournful'}
                        s3=s3+1;
                        s3i{2,1}=[s3i{2,1} survey2{i,col+1}]
                        s3i{2,2}=[s3i{2,2} i]

                    case {'Nostalgic, Sentimental, Dreamy, Touching, Longing'}
                        s3=s3+1;
                        s3i{3,1}=[s3i{3,1} survey2{i,col+1}]
                        s3i{3,2}=[s3i{3,2} i]

                end
                IntensityData{Story_Type(k,s),k,s,1}=s3i{1,1}; %IntensityData{storyN,surveyN,songN,corCatN}
                IntensityData{Story_Type(k,s),k,s,2}=s3i{2,1};
                IntensityData{Story_Type(k,s),k,s,3}=s3i{3,1};
             
                ParticipantNum{Story_Type(k,s),k,s,1}=s3i{1,2}; %IntensityData{storyN,surveyN,songN,corCatN}
                ParticipantNum{Story_Type(k,s),k,s,2}=s3i{2,2};
                ParticipantNum{Story_Type(k,s),k,s,3}=s3i{3,2};
            end
            if s== 4
                switch answer
                    
                    case {'Angry, Tragic, Restless, Tense, Anxious, Agitated'}
                        s4=s4+1;
                        s4i{1,1}=[s4i{1,1} survey2{i,col+1}]
                        s4i{1,2}=[s4i{1,2} i]

                    case {'Sad, Depressing, Gloomy, Dark, Mournful'}
                        s4=s4+1;
                        s4i{2,1}=[s4i{2,1} survey2{i,col+1}]
                        s4i{2,2}=[s4i{2,2} i]

                end
                IntensityData{Story_Type(k,s),k,s,1}=s4i{1,1}; %IntensityData{storyN,surveyN,songN,corCatN}
                IntensityData{Story_Type(k,s),k,s,2}=s4i{2,1};
                IntensityData{Story_Type(k,s),k,s,3}=NaN;
                
               
             ParticipantNum{Story_Type(k,s),k,s,1}=s4i{1,2}; 
             ParticipantNum{Story_Type(k,s),k,s,2}=s4i{2,2};
             ParticipantNum{Story_Type(k,s),k,s,3}=s4i{3,2};
             
             
            end
            if s== 5
                switch answer
                    
                    case {'Angry, Tragic, Restless, Tense, Anxious, Agitated'}
                        s5=s5+1;
                        s5i{1,1}=[s5i{1,1} survey2{i,col+1}]
                        s5i{1,2}=[s5i{1,2} i]

                    case {'Sad, Depressing, Gloomy, Dark, Mournful'}
                        s5=s5+1;
                        s5i{2,1}=[s5i{2,1} survey2{i,col+1}]
                        s5i{2,2}=[s5i{2,2} i]

                end
                IntensityData{Story_Type(k,s),k,s,1}=s5i{1,1}; %IntensityData{storyN,surveyN,songN,corCatN}
                IntensityData{Story_Type(k,s),k,s,2}=s5i{2,1};
                IntensityData{Story_Type(k,s),k,s,3}=NaN;
                
                ParticipantNum{Story_Type(k,s),k,s,1}=s5i{1,2}; %IntensityData{storyN,surveyN,songN,corCatN}
                ParticipantNum{Story_Type(k,s),k,s,2}=s5i{2,2};
                ParticipantNum{Story_Type(k,s),k,s,3}=NaN;
                
            end
            if s== 6
                switch answer
                    
                    case {'Happy, Joyous, Cheerful, Bright, Sunny, Fun','Playful, Light, Graceful, Humorous, Quaint, Merry'}
                        s6=s6+1;
                        s6i{1,1}=[s6i{1,1} survey2{i,col+1}]
                        s6i{1,2}=[s6i{1,2} i]

                        
                    case {'Tranquil, Peaceful, Gentle, Serene, Comforting, Tender, Graceful, Calm'}
                        s6=s6+1;
                        s6i{2,1}=[s6i{2,1} survey2{i,col+1}]
                        s6i{2,2}=[s6i{2,2} i]

                    case {'Nostalgic, Sentimental, Dreamy, Touching, Longing'}
                        s6=s6+1;
                        s6i{3,1}=[s6i{3,1} survey2{i,col+1}]
                        s6i{3,2}=[s6i{3,2} i]

                end
                IntensityData{Story_Type(k,s),k,s,1}=s6i{1,1}; %IntensityData{storyN,surveyN,songN,corCatN}
                IntensityData{Story_Type(k,s),k,s,2}=s6i{2,1};
                IntensityData{Story_Type(k,s),k,s,3}=s6i{3,1};
               
                ParticipantNum{Story_Type(k,s),k,s,1}=s6i{1,2}; %IntensityData{storyN,surveyN,songN,corCatN}
                ParticipantNum{Story_Type(k,s),k,s,2}=s6i{2,2};
                ParticipantNum{Story_Type(k,s),k,s,3}=s6i{3,2};
            end
                
            if s== 7
                switch answer
                    
                    case {'Happy, Joyous, Cheerful, Bright, Sunny, Fun','Playful, Light, Graceful, Humorous, Quaint, Merry'}
                        s7=s7+1;
                        s7i{1,1}=[s7i{1,1} survey2{i,col+1}]
                        s7i{1,2}=[s7i{1,2} i]

                    case {'Exciting, Passionate, Tumultuous, Exhilarated, Soaring'}
                        s7=s7+1;
                        s7i{2,1}=[s7i{2,1} survey2{i,col+1}]
                        s7i{2,2}=[s7i{2,2} i]

                end
                IntensityData{Story_Type(k,s),k,s,1}=s7i{1,1}; %IntensityData{storyN,surveyN,songN,corCatN}
                IntensityData{Story_Type(k,s),k,s,2}=s7i{2,1};
                IntensityData{Story_Type(k,s),k,s,3}=NaN;
                  
               
                ParticipantNum{Story_Type(k,s),k,s,1}=s7i{1,2}; %IntensityData{storyN,surveyN,songN,corCatN}
                ParticipantNum{Story_Type(k,s),k,s,2}=s7i{2,2};
                ParticipantNum{Story_Type(k,s),k,s,3}=NaN;
                
            end
            if s== 8
                switch answer
                    case {'Nostalgic, Sentimental, Dreamy, Touching, Longing'}
                        s8=s8+1;
                        s8i{1,1}=[s8i{1,1} survey2{i,col+1}]
                        s8i{1,2}=[s8i{1,2} i]

                    case {'Tranquil, Peaceful, Gentle, Serene, Comforting, Tender, Graceful, Calm'}
                        s8=s8+1;
                        s8i{2,1}=[s8i{2,1} survey2{i,col+1}]
                        s8i{2,2}=[s8i{2,2} i]

                    case {'Sad, Depressing, Gloomy, Dark, Mournful'}
                        s8=s8+1;
                        s8i{3,1}=[s8i{3,1} survey2{i,col+1}]
                        s8i{3,2}=[s8i{3,2} i]

                        
                end
                IntensityData{Story_Type(k,s),k,s,1}=s8i{1,1}; %IntensityData{storyN,surveyN,songN,corCatN}
                IntensityData{Story_Type(k,s),k,s,2}=s8i{2,1};
                IntensityData{Story_Type(k,s),k,s,3}=s8i{3,1};
                
               
                ParticipantNum{Story_Type(k,s),k,s,1}=s8i{1,2}; %IntensityData{storyN,surveyN,songN,corCatN}
                ParticipantNum{Story_Type(k,s),k,s,2}=s8i{2,2};
                ParticipantNum{Story_Type(k,s),k,s,3}=s8i{3,2};
            end
            if s== 9
                switch answer
                    
                    case {'Exciting, Passionate, Tumultuous, Exhilarated, Soaring'}
                        s9=s9+1;
                        s9i{1,1}=[s9i{1,1} survey2{i,col+1}]
                        s9i{1,2}=[s9i{1,2} i]


                    case {'Happy, Joyous, Cheerful, Bright, Sunny, Fun','Playful, Light, Graceful, Humorous, Quaint, Merry'}
                        s9=s9+1;
                        s9i{2,1}=[s9i{2,1} survey2{i,col+1}]
                        s9i{2,2}=[s9i{3,2} i]

                        
                        
                end
                IntensityData{Story_Type(k,s),k,s,1}=s9i{1,1}; %IntensityData{storyN,surveyN,songN,corCatN}
                IntensityData{Story_Type(k,s),k,s,2}=s9i{2,1};
                IntensityData{Story_Type(k,s),k,s,3}=NaN;
                
                
                ParticipantNum{Story_Type(k,s),k,s,1}=s9i{1,2}; %IntensityData{storyN,surveyN,songN,corCatN}
                ParticipantNum{Story_Type(k,s),k,s,2}=s9i{2,2};
                ParticipantNum{Story_Type(k,s),k,s,3}=s9i{3,2};
               
            end
            if s== 10
                switch answer
                    
                    case {'Happy, Joyous, Cheerful, Bright, Sunny, Fun','Playful, Light, Graceful, Humorous, Quaint, Merry'}
                        s10=s10+1;
                        s10i{1,1}=[s10i{1,1} survey2{i,col+1}]
                        s10i{1,2}=[s10i{1,2} i]

                    case {'Tranquil, Peaceful, Gentle, Serene, Comforting, Tender, Graceful, Calm'}
                        s10=s10+1;
                        s10i{2,1}=[s10i{2,1} survey2{i,col+1}]
                        s10i{2,2}=[s10i{2,2} i]


                end
                IntensityData{Story_Type(k,s),k,s,1}=s10i{1,1}; %IntensityData{storyN,surveyN,songN,corCatN}
                IntensityData{Story_Type(k,s),k,s,2}=s10i{2,1};
                IntensityData{Story_Type(k,s),k,s,3}=NaN;
                
               
                ParticipantNum{Story_Type(k,s),k,s,1}=s10i{1,2}; %IntensityData{storyN,surveyN,songN,corCatN}
                ParticipantNum{Story_Type(k,s),k,s,2}=s10i{2,2};
                ParticipantNum{Story_Type(k,s),k,s,3}=s10i{3,2};
            end
            
            if s== 11
                switch answer
                    
                    case {'Angry, Tragic, Restless, Tense, Anxious, Agitated'}
                        s11=s11+1;
                        s11i{1,1}=[s11i{1,1} survey2{i,col+1}]
                        s11i{1,2}=[s6i{1,2} i]

                    case {'Exciting, Passionate, Tumultuous, Exhilarated, Soaring'}
                        s11=s11+1;
                        s11i{2,1}=[s11i{2,1} survey2{i,col+1}]
                        s11i{2,2}=[s11i{2,2} i]

                    case {'Spiritual, Sublime, Sacred, Serious, Awe-inspiring'}
                        s11=s11+1;
                        s11i{3,1}=[s11i{3,1} survey2{i,col+1}]
                        s11i{3,2}=[s11i{3,2} i]


                end
                IntensityData{Story_Type(k,s),k,s,1}=s11i{1,1}; %IntensityData{storyN,surveyN,songN,corCatN}
                IntensityData{Story_Type(k,s),k,s,2}=s11i{2,1};
                IntensityData{Story_Type(k,s),k,s,3}=s11i{3,1};
                
                
                ParticipantNum{Story_Type(k,s),k,s,1}=s11i{1,2}; %IntensityData{storyN,surveyN,songN,corCatN}
                ParticipantNum{Story_Type(k,s),k,s,2}=s11i{2,2};
                ParticipantNum{Story_Type(k,s),k,s,3}=s11i{3,2};
                
            end
            if s== 12
                switch answer
                    
                    case {'Happy, Joyous, Cheerful, Bright, Sunny, Fun','Playful, Light, Graceful, Humorous, Quaint, Merry'}
                        s12=s12+1;
                        s12i{1,1}=[s12i{1,1} survey2{i,col+1}]
                        s12i{1,2}=[s12i{1,2} i]

                end
                IntensityData{Story_Type(k,s),k,s,1}=s12i{1,1}; %IntensityData{storyN,surveyN,songN,corCatN}
                IntensityData{Story_Type(k,s),k,s,2}=NaN;
                IntensityData{Story_Type(k,s),k,s,3}=NaN;
                
                
                ParticipantNum{Story_Type(k,s),k,s,1}=s12i{1,2}; %IntensityData{storyN,surveyN,songN,corCatN}
                ParticipantNum{Story_Type(k,s),k,s,2}=NaN;
                ParticipantNum{Story_Type(k,s),k,s,3}=NaN;
            end
        end
        
        
    end
    numCorrect= [s1, s2, s3, s4, s5, s6, s7, s8, s9, s10,s11, s12]
    
    clipCat={'Clip1', 'Clip2', 'Clip3', 'Clip4', 'Clip5', 'Clip6', 'Clip7', 'Clip8', 'Clip9', 'Clip10', 'Clip11','Clip12',}
    figure;
    
    h=histogram('Categories',clipCat,'BinCounts',numCorrect)
    title(['Number of Correct Responses per Song Clip in Survey#' num2str(k)])
    xlabel('Song Number')
    ylabel('# of "Correct" Responses')
    
    %attempt to color them by program note condition
    bar_child=get(h,'Children');
    set(bar_child,'CData',clipCat);
    mycolor=[0 0 0;0 0 1;1 0 0;1 0 0];
    colormap(mycolor)
    set(bar_child,'CDataMapping','direct');
    
    
    
end

%%
% possible input arguments for Story_Type
% first argument: 1:3
% second argument: 1:12

% IntensityData= cell(storyN,surveyN,songN,corCatN)

story_type1 = {};
story_type1 = {};
story_type2 = {};
story_type3 = {};
story_type4 = {};

story_type1_all =[];
story_type2_all = [];
story_type3_all = [];
story_type4_all = [];

curr_story_1 = 1;
curr_story_2 = 1;
curr_story_3 = 1;
curr_story_4 = 1;

for isurvey=1:surveyN
    for isong=1:songN
        for icorcat=1:corCatN
            type = Story_Type(isurvey,isong);
            
            IntensityData{Story_Type(isurvey,isong),isurvey,isong,icorcat}
            if ~isnan(IntensityData{Story_Type(isurvey,isong),isurvey,isong,icorcat})
                switch type
                    
                    case 1
                        story_type1{curr_story_1}= IntensityData{Story_Type(isurvey,isong),isurvey,isong,icorcat};
                        story_type1_all = [story_type1_all IntensityData{Story_Type(isurvey,isong),isurvey,isong,icorcat}];
                        curr_story_1 = curr_story_1 + 1;
                        
                    case 2
                        story_type2{curr_story_2}= IntensityData{Story_Type(isurvey,isong),isurvey,isong,icorcat};
                        story_type2_all = [story_type2_all IntensityData{Story_Type(isurvey,isong),isurvey,isong,icorcat}];
                        curr_story_2 = curr_story_2 + 1;
                    case 3
                        story_type3{curr_story_3}= IntensityData{Story_Type(isurvey,isong),isurvey,isong,icorcat};
                        story_type3_all = [story_type3_all IntensityData{Story_Type(isurvey,isong),isurvey,isong,icorcat}];
                        curr_story_3 = curr_story_3 + 1;
                    case 4
                        story_type4{curr_story_4}= IntensityData{Story_Type(isurvey,isong),isurvey,isong,icorcat};
                        story_type4_all = [story_type4_all IntensityData{Story_Type(isurvey,isong),isurvey,isong,icorcat}];
                        curr_story_4 = curr_story_4 + 1;
                end
            end
        end
    end
    
end



[story_type1_all,story_type2_all,story_type3_all,story_type4_all];
surveyAll_Int_Mat = nan(4,300);

surveyAll_Int_Mat(1,1:length(story_type1_all))=story_type1_all;
surveyAll_Int_Mat(2,1:length(story_type2_all))=story_type2_all;
surveyAll_Int_Mat(3,1:length(story_type3_all))=story_type3_all;
surveyAll_Int_Mat(4,1:length(story_type4_all))=story_type4_all;

sAll_means = nanmean(surveyAll_Int_Mat')

figure;
anova1(surveyAll_Int_Mat')
title('Total Survey Responses')
xlabel('Story Types')
ylabel('Intensity') 


%Plot Histogram
stypes = {'Story Type 1: Human Composed','Story Type 1: Human Data Sonification','Story Type 1: Nature Data Sonification','Story Type 1: Machine Algorithm'}
figure;
h=histogram('Categories',stypes,'BinCounts',sAll_means)
title('Suvey All Means')
