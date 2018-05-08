class MessagesController < ApplicationController
	before_action do
		@conversation = Conversation.find(params[:conversation_id])
  end


  #identify messages, if the number is greater than 10 then assign variables accordingly
  def index
  	@messages = @conversation.messages
  		if @messages.length > 10
  			@over_ten = true
  			@messages = @messages[-10..-1]
  		end
  		if params[:m]
  			@over_ten = false
  			@messages = @conversation.messages
  		end

  	if @messages.last
  		if @messages.last.user_id != current_user.id
  			@messages.last.read = true
  		end
  	end

  	@message = @conversation.messages.new

  end

  def new
  	@message = @conversation.messages.new
  end

  #create new message as child of conversation
  def create
  	@message = @conversation.messages.new(message_params)
  	if @message.save
  		redirect_to conversation_messages_path(@conversation)
      #redirect to the parent conversation
  	end
  end

  private

  #defined strong params for messages
  def message_params
  	params.require(:message).permit(:body, :user_id)
  end


end
