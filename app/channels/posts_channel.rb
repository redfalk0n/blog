class PostsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "posts_#{params[:id]}"
    ActionCable.server.broadcast("posts_#{params[:id]}", { message: "Share data" })
  end

  def receive(data)
    ActionCable.server.broadcast("posts_#{params[:id]}", data)
  end
end
