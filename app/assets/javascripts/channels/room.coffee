# app/assets/javascripts/channels/room.coffee はクライアントサイドの処理を受け持つチャンネル
App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server



  received: (data) ->
    $('#messages').append data['message']
    # サーバーからデータを受け取ったときの動きを定義します。
    # Called when there's incoming data on the websocket for this channel

  speak: (message) ->
    @perform 'speak', message: message
    # クライアントサイドのspeakアクション
    # サーバーサイド(room_channnel)のspeakアクションを呼びだし、messageをパラメータとして渡してる

$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
# ここではリターンキー（keycodeが13）が押されたときに、Roomチャンネルのspeakアクションを実行しています。
  if event.keyCode is 13 # return = send
    App.room.speak event.target.value
    event.target.value = ''
    event.preventDefault()
