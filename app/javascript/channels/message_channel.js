import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const username = JSON.parse(document.getElementById("user-name").dataset.json);
    const html = `<div class="message">
                    <div class="upper-message">
                      <div class="message-user">
                        ${username}
                      </div>
                      <div class="message-date">
                        ${data.content.created_at}
                      </div>
                    </div>
                    <div class="lower-message">
                      <div class="message-content", id="messages">
                        ${data.content.content}
                      </div>
                    </div>
                  </div>`;
    const messages = document.getElementById('message');
    const newMessage = document.getElementById('message_content');
    messages.insertAdjacentHTML('beforeend', html);
    newMessage.value='';
    // Called when there's incoming data on the websocket for this channel
  }
});

//, class: 'message-image' if message.image.attached?%>