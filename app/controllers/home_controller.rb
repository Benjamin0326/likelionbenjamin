require 'mailgun'

class HomeController < ApplicationController
    def index
        
    end
    
    def write
        @title = params[:title]
        @content = params[:content]
        
        new_post = Post.new
        new_post.title=@title
        new_post.content=@content
        new_post.save
        
        redirect_to "/list"
    end
    
    def deleteC
        @id = params[:id_of_comment]
        comment=Comment.find(@id)
        comment.destroy
        redirect_to "/list"
        
    end
    
    def deleteP
        @id = params[:id_of_post]
        comment=Post.find(@id)
        comment.destroy
        redirect_to "/list"
        
    end
    
    def writeC
       @comment = params[:com]
       @id_of_post = params[:id_of_post]
        new_comment = Comment.new
        new_comment.content= @comment
        new_comment.post_id= @id_of_post
        new_comment.save
        
        redirect_to "/list"
    end
    
    def list
        @post_list = Post.all.order('id desc')
    end
end
