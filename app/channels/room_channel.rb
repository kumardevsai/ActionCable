# app/channels/room_channel.rb はサーバーサイドの処理を受け持つチャンネル
class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # サーバーサイドのspeakアクションでクライアントサイドから送信されたメッセージを受信する
    # 受け取ったメッセージを、 Message モデルに保存
    # ここだとcreateした後にコールバック（Messageモデルのafter_create_commit)が呼ばれる
    Message.create! content: data['message']

# -----------------------------------------------------------------------------------------

    # ActionCable.server.broadcast 'room_channel', message: data['message']
    # クライアントから送信されたmessageデータを受け取り、全クライアントへブロードキャストしています。
  end
end
