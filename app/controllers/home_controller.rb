require 'mailgun'

class HomeController < ApplicationController
    def index
        
    end
    
    def write
        @address = params[:receiver]
        @title = params[:title]
        @content = params[:content]
        
        
        mg_client = Mailgun::Client.new("key-b4be63bce7bdf34ac58a2588efcd3bc6")
        
        message_params =  {
                           from: 'postmaster@sandbox27b08378169e476781f930d041219089.mailgun.org',
                           to:   @address,
                           subject: @title,
                           text:    @content
                          }
        
        result = mg_client.send_message('sandbox27b08378169e476781f930d041219089.mailgun.org', message_params).to_h!
        
        message_id = result['id']
        message = result['message']
        
        new_post = Post.new
        new_post.email=@address
        new_post.title=@title
        new_post.content=@content
        new_post.save
        
        redirect_to "/list"
    end
    
    def list
        @post_list = Post.all.order('id desc')
    end
end
