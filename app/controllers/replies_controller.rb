class RepliesController < ApplicationController

    before_action :authenticate_user!
    before_action :set_reply, only: [:edit, :update, :show, :destroy]
    #set the reply only to edit update show and destroy
    before_action :set_discussion, only: [:edit, :update, :show, :destroy]
    #set the discussion only to edit update show and destroy

    def create
        @reply = @discussion.replies.create(params[:reply]).permit(:reply , :discussion)
        # create a reply within the discussion 
        reply.user_id = current_user.id
        #show who creates the reply.


        respond_to do |format| #create a record within another record

            if @reply.save   #if reply is saved, render format which is discussion path in params discussion id
                format.html {redirect_to discussion_path(@discussion)}
                format.js #render create.js.erb (ajax)
            else
                format.html {redirect_to discussion_path(@discussion), notice: 'Reply not saved. Please try again !'}
                format.js
            end
        end
    end

    def destroy
        @reply = @discussion.replies.find #find reply which is in discussion id in which there is replies.
        @reply.destroy
        redirect_to discussion_path(@discussion)#redirect to the discussion id
    end

    def edit
        @discussion = Discussion.find(params[:discussion_id])
        @reply = @discussion.replies.find(params[:id])#@discussion come from above line
    end

    def update
        @reply = @discussion.replies.find(params[:id])#find discussion
        respond_to do |format| 
            if @reply.update(reply_params)#if reply is updated, redirect to discussion path else render edit
                format.html {redirect_to discussion_path(@discussion), notice: "Reply was successfully updated !"}
            else
                format.html {render :edit}
                format.json {render.json: @reply.errors, status: :unprocessable_entity}
        end
    end



    private

    def set_discussion
        @discussion = Discussion.find(params[:discussion_id])
    end

    def set_reply
        @reply = Reply.find(params[:id])
    end

    def reply_params
        params.require(:reply).permit(:reply)
    end






end