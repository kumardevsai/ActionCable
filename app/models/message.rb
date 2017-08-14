class Message < ApplicationRecord
  # room_channelでcreateした時に呼ばれるコールバック
  # after_createではなく、after_create_commitを使っているのは、トランザクションをコミットしたあとでブロードキャストしないと、他のクライアントからデータが見えない恐れがあるため
  after_create_commit { MessageBroadcastJob.perform_later self }

end
