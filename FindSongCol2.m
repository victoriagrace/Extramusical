function col = FindSongCol(num)
%Takes in a song number and specifies correct cell column
songNum=num;
col=0;
        switch lower(songNum)
          case 1
            col=17;
          case 2
            col=19;
          case 3
            col=21;
          case 4
            col=23;
          case 5
            col=25;
          case 6
            col=27;
          case 7
            col=29;
          case 8
            col=31; 
          case 9
            col=33; 
          case 10
            col=35; 
           case 11
            col=37 ;  
           case 12
            col=39;
            
                   
        end
        
        