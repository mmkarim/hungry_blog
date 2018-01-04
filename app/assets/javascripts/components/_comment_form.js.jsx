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
      },
      error: (response) => {
        // response.responseJSON.errors.email
        console.log("An error occured");
      }
    });
  },

  render() {
    return (
      <div>
        <div className="row">
          <div className="col-xs-3">
            <input ref="email" className="form-control" placeholder="email"></input>
          </div>
        </div>
        <div className="row">
          <div className="col-xs-5">
            <textarea ref="text" className="form-control" placeholder="comment"></textarea>
          </div>
          <button onClick={this.handleClick} className="btn btn-default">Submit</button>
        </div>
      </div>
    )
  }
});
