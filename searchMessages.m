function searchMessages(app)
%Depending on number of messages the user want to get, the
            %function prints that amount
            
%Assigning redentials for Twitter API
            ConsumerKey = 'ZoVIkp7MmCjxAG8V1rFd4h6v0';
            ConsumerSecret = '98WiehGOTMpejJf69loqxIV8tU6K1XeyMyM0RzLMgxsgUZaXm5';
            AccessToken = '2560721233-dI71b0HBhY2QkJ4QTIc3w3Slhd5hBKbnXhcJtGX';
            AccessTokenSecret = 'SjpySq3bDCbLQinDOvNPXeMpqimJjs5kleIt54i636i37';

            %Function to Create API Call Object
            call = callCreator(ConsumerKey, ConsumerSecret, AccessToken, AccessTokenSecret);
            
            %Checks if tweets exist with password
            tweetData = search(call, app.SearchforPasswordTextArea.Value, 'count', 100);

            theTweet = cell(1, 100);
            print = {};
            if (isempty(tweetData.Body.Data.statuses))
                tweetData = search(call, app.SearchforPasswordTextArea.Value, 'count', 100);
                app.MessagesTextArea.Value = 'No messages';
            else
                if str2num(app.ofMessagestoViewTextArea.Value{1}) > 1
                    for i = 1:str2num(app.ofMessagestoViewTextArea.Value{1})
                        theTweet{i} = tweetData.Body.Data.statuses{i}.text;
                        print{i,1} = theTweet{i};
                    end
                     app.MessagesTextArea.Value = print;
                end
                if str2num(app.ofMessagestoViewTextArea.Value{1}) == 1
                    theTweet{1} = tweetData.Body.Data.statuses{1}.text;
                    app.MessagesTextArea.Value = theTweet{1};
                end
            end  
end