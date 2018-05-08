class ConversationsController < ApplicationController
before_action :authenticate_user!

	def index
 		@user = current_user
 		#find all conversations where the user is either the sender or recipient
 		#this has to be this way because conversations only belong to users if they are the original sender, not the recipient
 		@conversations = Conversation.where('recipient_id == ? OR sender_id == ?', @user.id, @user.id)

 	end


 	#cretae conversation between two users
 	def create
 		if Conversation.between(params[:sender_id],params[:recipient_id]).present?
    	@conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
	 	else
	  	@conversation = Conversation.create!(conversation_params)
	 	end
	 	#redirect to the new conversation

	  redirect_to conversation_messages_path(@conversation)

	end

	private


	#strong params defined 
	def conversation_params
		params.permit(:sender_id, :recipient_id)
	end

	
end
