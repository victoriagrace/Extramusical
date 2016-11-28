% Generates histogram showing number of correct responses per song in each
% survey
close all

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
s1i=cell(3,1),s2i=cell(3,1),s3i=cell(3,1),s4i=cell(2,1),s5i=cell(2,1),s6i=cell(3,1),s7i=cell(2,1),s8i=cell(3,1),s9i=cell(2,1),s10i=cell(2,1),s11i=cell(3,1),s12i=cell(1,1); %list of intensities


for s=1:1:12
     
 col = FindSongCol(s) %use function to find correct column
 col = col-1; %use function to find correct column

for i=1:1:rows
answer = survey2{i,col+1}; % go through each row in a column and check


    if s==1
        switch answer  
            case {'Nostalgic, Sentimental, Dreamy, Touching, Longing'}
                s1=s1+1;
                s1i{1,1}=[s1i{1,1} survey2{i,col+2}]
             case {'Tranquil, Peaceful, Gentle, Serene, Comforting, Tender, Graceful, Calm'}
                 s1=s1+1;
                 s1i{2,1}=[s1i{2,1} survey2{i,col+2}]
             case {'Sad, Depressing, Gloomy, Dark, Mournful'}
                 s1=s1+1;
                 s1i{3,1}=[s1i{3,1} survey2{i,col+2}]
        end
    end
    if s== 2 
        switch answer
            case {'Sad, Depressing, Gloomy, Dark, Mournful'}
                s2=s2+1;
                s2i{1,1}=[s2i{1,1} survey2{i,col+2}]
            case {'Tranquil, Peaceful, Gentle, Serene, Comforting, Tender, Graceful, Calm'}
                 s2=s2+1;
                 s2i{2,1}=[s2i{2,1} survey2{i,col+2}]
            case {'Spiritual, Sublime, Sacred, Serious, Awe-inspiring'}
                 s2=s2+1;
                 s2i{3,1}=[s2i{3,1} survey2{i,col+2}]
        end
    end
         if s== 3 
        switch answer
            case {'Angry, Tragic, Restless, Tense, Anxious, Agitated'}
                s3=s3+1;
                s3i{1,1}=[s3i{1,1} survey2{i,col+2}]
            case {'Sad, Depressing, Gloomy, Dark, Mournful'}
                 s3=s3+1;
                 s3i{2,1}=[s3i{2,1} survey2{i,col+2}]
            case {'Nostalgic, Sentimental, Dreamy, Touching, Longing'}
                 s3=s3+1;
                 s3i{3,1}=[s3i{3,1} survey2{i,col+2}]    
        end
         end
        if s== 4 
        switch answer
          
             case {'Angry, Tragic, Restless, Tense, Anxious, Agitated'}
                s4=s4+1;
                s4i{1,1}=[s4i{1,1} survey2{i,col+2}]
            case {'Sad, Depressing, Gloomy, Dark, Mournful'}
                 s4=s4+1;
                 s4i{2,1}=[s4i{2,1} survey2{i,col+2}]
        end
        end
        if s== 5 
        switch answer
            
            case {'Angry, Tragic, Restless, Tense, Anxious, Agitated'}
                s5=s5+1;
                s5i{1,1}=[s5i{1,1} survey2{i,col+2}]
            case {'Sad, Depressing, Gloomy, Dark, Mournful'}
                 s5=s5+1;
                 s5i{2,1}=[s5i{2,1} survey2{i,col+2}]
            
        end
        end
         if s== 6 
        switch answer
         
            case {'Happy, Joyous, Cheerful, Bright, Sunny, Fun'}
                s6=s6+1;
                s6i{1,1}=[s6i{1,1} survey2{i,col+2}]
            case {'Tranquil, Peaceful, Gentle, Serene, Comforting, Tender, Graceful, Calm'}
                 s6=s6+1;
                 s6i{2,1}=[s6i{2,1} survey2{i,col+2}]
            case {'Nostalgic, Sentimental, Dreamy, Touching, Longing'}
                 s6=s6+1;
                 s6i{3,1}=[s6i{3,1} survey2{i,col+2}]    
        end
         end
          if s== 7 
        switch answer
          
            case {'Happy, Joyous, Cheerful, Bright, Sunny, Fun'}
                s7=s7+1;
                s7i{1,1}=[s7i{1,1} survey2{i,col+2}]
            case {'Exciting, Passionate, Tumultuous, Exhilarated, Soaring'}
                 s7=s7+1;
                 s7i{2,1}=[s7i{2,1} survey2{i,col+2}]    
        end
          end
            if s== 8 
        switch answer
            case {'Nostalgic, Sentimental, Dreamy, Touching, Longing'}
                 s8=s8+1;
                 s8i{1,1}=[s8i{1,1} survey2{i,col+2}]  
            case {'Tranquil, Peaceful, Gentle, Serene, Comforting, Tender, Graceful, Calm'}
                s8=s8+1;
                s8i{2,1}=[s8i{2,1} survey2{i,col+2}]
            case {'Sad, Depressing, Gloomy, Dark, Mournful'}
                 s8=s8+1;
                 s8i{3,1}=[s8i{3,1} survey2{i,col+2}]
                 
                end
            end
            if s== 9 
        switch answer
           
            case {'Exciting, Passionate, Tumultuous, Exhilarated, Soaring'}
                 s9=s9+1;
                 s9i{1,1}=[s9i{1,1} survey2{i,col+2}]  
            case {'Happy, Joyous, Cheerful, Bright, Sunny, Fun'}
                s9=s9+1;
                s9i{2,1}=[s9i{2,1} survey2{i,col+2}]
           
                 
                 end
            end
             if s== 10 
        switch answer
        
            case {'Happy, Joyous, Cheerful, Bright, Sunny, Fun'}
                 s10=s10+1;
                 s10i{1,1}=[s10i{1,1} survey2{i,col+2}]  
            case {'Tranquil, Peaceful, Gentle, Serene, Comforting, Tender, Graceful, Calm'}
                s10=s10+1;
                s10i{2,1}=[s10i{2,1} survey2{i,col+2}]
                end
             end
     if s== 11 
        switch answer
         
            case {'Angry, Tragic, Restless, Tense, Anxious, Agitated'}
                 s11=s11+1;
                 s11i{1,1}=[s11i{1,1} survey2{i,col+2}]  
            case {'Exciting, Passionate, Tumultuous, Exhilarated, Soaring'}
                s11=s11+1;
                s11i{2,1}=[s11i{2,1} survey2{i,col+2}]
            case {'Spiritual, Sublime, Sacred, Serious, Awe-inspiring'}
                 s11=s11+1;
                 s11i{3,1}=[s11i{3,1} survey2{i,col+2}]    
        end
     end
   if s== 12 
        switch answer
          
             case {'Happy, Joyous, Cheerful, Bright, Sunny, Fun'}
                 s12=s12+1;
                 s12i{1,1}=[s12i{1,1} survey2{i,col+2}]     
        end
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