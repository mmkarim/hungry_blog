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

  handleDelete(comment_id) {
    $.ajax({
        url: `/comments/${comment_id}`,
        type: 'DELETE',
        success:() => {
           this.removeComment(comment_id);
        }
    });
  },

  removeComment(comment_id) {
      var comments = this.state.comments.filter((comment) => {
          return comment.id != comment_id;
      });

    this.setState({ comments: comments });
  },

  render() {
    return (
      <div>
        <AllComments comments={this.state.comments} handleDelete={this.handleDelete}/>
        <CommentForm handleSubmit={this.handleSubmit} post_id={this.props.post_id} />
      </div>
    )
  }
});
