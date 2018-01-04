var CommentForm = React.createClass({
  handleClick() {
    var email = this.refs.email.value;
    var text = this.refs.text.value;

    $.ajax({
      url: '/comments',
      type: 'POST',
      data: {comment: {email: email, text: text, post_id: this.props.post_id}},
      success: (comment) => {
        this.props.handleSubmit(comment);
      }
    });
  },

  render() {
    return (
      <div className="form-inline">
        <div className="form-group">
          <input ref="email" className="form-control" placeholder="email"></input>
        </div>
        <div className="form-group">
          <input ref="text" className="form-control" placeholder="comment"></input>
        </div>
        <button onClick={this.handleClick} className="btn btn-default">Submit</button>
      </div>
    )
  }
});
