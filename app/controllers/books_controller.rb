
class BooksController < ApplicationController
  # GET /books
  # GET /books.json
  def index
    @books = Book.all
    @user = User.find_by_id(session["user_id"])
    
      usr=@user
     @i_lb=[] # Array I liked Books
        @u_lb=[] # Array users like a particular book
        usr.books.each do |lik_bks|
              @i_lb << lik_bks
              lik_bks.users.each do |usl|
                    if(usl.username != usr.username )
                      @u_lb << usl
                    end
              @u_lb=@u_lb.uniq
              @bks=[]
              end
              @u_lb.each do |b|
                b.books.each do |bk|
                  @bks << bk
                end
              end
        end
        @res=[]
        if(@bks!=nil)
          @bks=@bks.uniq
          @res =  @bks - @i_lb
      end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @books }
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])
    @ar=[]
    @book.users.each do |g|
        @ar << g.username
    end
    user = User.find_by_id(session["user_id"])
    @fl=1
    s = @ar.select {|a| a.match(user.username)}
    if(s.size==0)
      @fl=0
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/new
  # GET /books/new.json
  def new
    @book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/1/edit
  def edit
        b = Book.find(params[:id])  #get Book
        @book=b 
        
        user = User.find_by_id(session["user_id"]) #get user
        @u = user
        
        @likedusers=[]                      #other users who liked it
        
            b.users.each do |t|
                  @likedusers << t.username
            end
        
        
        s=@likedusers.select {|a| a.match(user.username)}  
            if(s.size==0)
                b.users << user 
                b.save
            end
        
        @i_lb=[] # Array I liked Books
        @u_lb=[] # Array users like a particular book
        user.books.each do |lik_bks|
              @i_lb << lik_bks
              lik_bks.users.each do |usl|
                    if(usl.username != user.username )
                      @u_lb << usl
                    end
              @u_lb=@u_lb.uniq
              @bks=[]
              end
              @u_lb.each do |b|
                b.books.each do |bk|
                  @bks << bk
                end
              end
        end
        @bks=@bks.uniq
          @res =  @bks - @i_lb
end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(params[:book])

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render json: @book, status: :created, location: @book }
      else
        format.html { render action: "new" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.json
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end
end

