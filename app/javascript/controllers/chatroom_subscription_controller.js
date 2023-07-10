import { Controller } from "@hotwired/stimulus";
import { createConsumer } from "@rails/actioncable";

// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static values = { chatroomId: Number, currentUserId: Number };
  static targets = ["messages"];
  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      {
        received: (data) => {
          this.#insertMessageAndScrollDown(data);
        },
      }
    );

    console.log(
      `Subscribe to the chatroom with the id ${this.chatroomIdValue}.`
    );
  }

  #insertMessageAndScrollDown(data) {
    const currentUserIsSender = this.currentUserIdValue === data.sender_id;
    const messageElement = this.#buildMessageElement(
      currentUserIsSender,
      data.message
    );
    this.messagesTarget.insertAdjacentHTML("beforeend", messageElement);
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight);
  }

  #buildMessageElement(currentUserIsSender, message) {
    if (currentUserIsSender) {
      return `
      <div class="message-row d-flex flex-column align-items-end">
        <div class="sender-style d-flex flex-column align-items-end">
          ${message}
        </div>
      </div>
    `;
    } else {
      return `
      <div class="message-row d-flex flex-column align-items-start">
      <div class="receiver-style d-flex flex-column align-items-start">
        ${message}
      </div>
    </div>
  `;
    }
  }

  resetForm(event) {
    event.target.reset();
  }
}
