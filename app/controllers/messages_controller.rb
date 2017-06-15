class MessagesController < ApplicationController
before_action :find_group
  def index
    @message = Message.new
    @messages = @group.messages.order('created_at ASC')
  end

  def create
    @message = Message.new(message_params)
    @user = @message.user
    if @message.save
      respond_to do |format|
        format.html {redirect_to group_messages_path, notice: "メッセージを送信しました"}
        format.json
      end
    else
      flash[:alert] = "メッセージを入力してください"
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:text,:image).merge(user_id: current_user.id, group_id: @group.id)
  end

  def find_group
    @group = Group.find(params[:group_id])
  end
end
