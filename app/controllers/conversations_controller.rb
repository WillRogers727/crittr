class ConversationsController < ApplicationController
before_action :authenticate_user!

	def index
 		@user = current_user
 		# @conversations = @user.conversations
 		@conversations = Conversation.where('recipient_id == ? OR sender_id == ?', @user.id, @user.id)
 		# .find_by_sql("SELECT * FROM conversations WHERE recipient_id == @user.id OR sender_id == @user.id")
 	end

 	def create
 		if Conversation.between(params[:sender_id],params[:recipient_id]).present?
    	@conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
	 	else
	  	@conversation = Conversation.create!(conversation_params)
	 	end

	  redirect_to conversation_messages_path(@conversation)

	end

	private
	 
	def conversation_params
		params.permit(:sender_id, :recipient_id)
	end

	
end
