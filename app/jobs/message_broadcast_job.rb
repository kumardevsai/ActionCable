class MessageBroadcastJob < ApplicationJob
  # 非同期でブロードキャストするためのMessageBroadcastジョブ
  # app/jobs/message_broadcast_job.rbのperformメソッドでサーバサイドのroom_channelで登録されたコメントを、クライアントにブロードキャストしている
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast 'room_channel', message: render_message(message)
    # messageは単純な文字列ではなく、messages/messageパーシャルビューのHTMLを返している
  end

  private

  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
end
