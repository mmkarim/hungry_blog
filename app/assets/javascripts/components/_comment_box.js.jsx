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
        success:() => {
           this.removeComment(commentId);
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
        <AllComments comments={this.state.comments} handleDelete={this.handleDelete}/>
        <CommentForm handleSubmit={this.handleSubmit} errors={this.state.errors} post_id={this.props.post_id} />
      </div>
    )
  }
});
