class WordCounter

    # Create the object
    def initialize (file_name=nil)
        @file_name=file_name
    end

    # Count the words if the file is valid and not empty, otherwise return a string
    def count
        # if user didn't enter a file name
        if @file_name.nil?
            return "You didn't enter a valid file name. Please double check."
        # if the file exists
        elsif File.exists?(@file_name)
            # open the file
            file=File.open(@file_name,"r")

            # if the file is empty
            if File.zero?(file) 
                # print a message
                return "The file "+@file_name+" is empty."
            else
            # if the file has contents, use Hash (the key is unique words, 
            # the value is the number of times unique words appears in the file)

                file_data=file.read
                words=file_data.split(",")
                counter=Hash.new
                words.each do |word|
                    if counter.keys.include?word  # check if the word already exist
                        counter[word]+=1
                    else
                        if not word.strip.empty? # check if the word is not empty
                            counter[word]=1
                        end
                    end
                end
                return counter
            
            file.close
            end
        else # when the file doesn't exist
            return "Sorry, the file name you entered "+@file_name +" doesn't exist."

        end
    end

    # Display the output properly. If the returned value is a string, return the string.
    # If the returned value is a Hash, concatenate the key, value pairs to separate rows of the string, and return the string
    def process_output(counter)
    # if the return type of counter is String, it means that the file name is not valid or the file is empty, print the message
        return_value=""
        if counter.is_a?(String)
            return_value=counter
        # if the return type of counter is not String, it means that the file is not empty
        else
            return_value+= "The word count in the file "+@file_name+" is:\n"
            counter.each do |key,value|
                return_value+= key.to_s + ","+value.to_s+"\n"
            end
        end
        return return_value
    end
end

