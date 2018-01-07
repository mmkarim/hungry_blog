var CommentBox = React.createClass({
  getInitialState() {
    return { comments: [] }
  },

  componentDidMount(){
    $.getJSON('/comments.json', {post_id: this.props.post_id}, (response) => {
      this.setState({comments: response})
    });
  },

  handleSubmit(comment) {
    this.setState({comments: this.state.comments.concat(comment)});
  },

  handleDelete(commentId) {
    $.ajax({
        url: `/comments/${commentId}`,
        type: 'DELETE',
        data: {jwt: this.props.jwt},
        dataType: "json",
        success:(response) => {
          this.removeComment(commentId);
        },
        error:(response) => {
          alert("Authorization Failed!");
        }
    });
  },

  removeComment(commentId) {
    var comments = this.state.comments.filter((comment) => {
      return comment.id != commentId;
    });

    this.setState({ comments: comments });
  },

  render() {
    return (
      <div>
        <AllComments
          comments={this.state.comments}
          handleDelete={this.handleDelete}
          jwt={this.props.jwt} />

        <CommentForm
          handleSubmit={this.handleSubmit}
          errors={this.state.errors}
          post_id={this.props.post_id} />
      </div>
    )
  }
});
