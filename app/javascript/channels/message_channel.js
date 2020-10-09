import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {

    const html = `<p>${data.content.content}</p>`;
    const image = `<p>${data.content.image}</p>`;
    const messages = document.getElementById('messages');
    const newMessage = document.getElementById('message_content');
    messages.insertAdjacentHTML('afterbegin', html);
    messages.insertAdjacentHTML('afterbegin', image);
    newMessage.value='';

    // Called when there's incoming data on the websocket for this channel

  }
});
