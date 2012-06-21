
#I had to explicitly write the OPenlibrary fetched data to the Data.txt file because the gem openlibrary was not being loaded into the environment. tried a lot on the issue but couldn't find a solution
counter=0;

b=Book.new
File.open("/home/solomon/rails_project/App/db/Data.txt","r") do |infile|
        while (line = infile.gets)
            l="-----\n"
                if(line == l)
                counter = 0
                     next
                end
           puts counter+=1
            if(counter==1)
                b.title=line
            elsif(counter==3)    
                b.ISBN_10=line
            elsif(counter==4)
                if(line!="\n")
                    b.authors="\'"+ line +"\''"
                end
            elsif(counter==5)
                b.pages=line
            elsif(counter==6)
                b.weight=line
                b.save
                b=Book.new
            end
        end
end
