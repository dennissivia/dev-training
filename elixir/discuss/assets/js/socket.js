import {Socket} from "phoenix";

let socket = new Socket("/socket", {params: {token: window.userToken}});

socket.connect();

// Now that you are connected, you can join channels with a topic:
const createSocket = (topicId) => {
    let channel = socket.channel(`comments:${topicId}`, {});
    channel.join()
        .receive("ok", resp => {
            renderComments(resp.comments);
        })
        .receive("error", resp => { console.log("Unable to join", resp); });

    channel.on(`comments:${topicId}:new`, renderComment);

    document.querySelector('button').addEventListener('click', function(){
        const content = document.querySelector('textarea').value;
        channel.push('comment:add', {content: content});
    });
};

const commentTempate = (comment) => {
    const email = comment.user ? comment.user.email : "Unknown user";

    return `<li class="collection-item">
              ${comment.content}
              <div class="secondary-content">
                ${email}
              </div>
            </li>`;
};

const renderComment = (event) => {
    console.log("rendering comment", event.comment);
    const renderedComment = commentTempate(event.comment);

    document.querySelector('ul.collection').innerHTML += renderedComment;
};

const renderComments = (comments = []) => {
    const renderedComments = comments.map(comment => {
        return commentTempate(comment);
    });
    document.querySelector('ul.collection').innerHTML = renderedComments.join('');
};

window.createSocket = createSocket;
