var CommentForm = React.createClass({
  initialState() {
    return { errors: { email: [], text: [] }, email: "", text: "" }
  },

  getInitialState() {
    return this.initialState();
  },

  handleEmailChange(e){
    this.setState({email: e.target.value});
  },

  handleTextChange(e){
    this.setState({text: e.target.value});
  },

  handleClick() {
    var email = this.refs.email.value;
    var text = this.refs.text.value;

    $.ajax({
      url: '/comments',
      type: 'POST',
      data: {comment: {email: email, text: text, post_id: this.props.post_id}},
      success: (comment) => {
        this.props.handleSubmit(comment);
        this.setState(this.initialState());
      },
      error: (response) => {
        var errors = response.responseJSON.errors;
        var email = errors["email"] ? errors["email"] : []
        var text = errors["text"] ? errors["text"] : []

        email = email.map(e => 'Email ' + e )
        text = text.map(e => 'Text ' + e )

        this.setState({ errors: { email: email, text: text } });
      }
    });
  },

  render() {
    return (
      <div>
        <div className="row">
          <div className="col-xs-3">
            <small className="text-danger">{this.state.errors.email.join(", ")}</small>
            <input ref="email" onChange={this.handleEmailChange} value={this.state.email} className="form-control" placeholder="email">

            </input>
          </div>
        </div>
        <div className="row">
          <div className="col-xs-5">
            <small className="text-danger">{this.state.errors.text.join(", ")}</small>
            <textarea ref="text" onChange={this.handleTextChange} value={this.state.text} className="form-control" placeholder="comment">

            </textarea>
          </div>
        </div>
        <div className="row">
          <div className="col-xs-5">
            <button onClick={this.handleClick} className="btn btn-default">Submit</button>
          </div>
        </div>
      </div>
    )
  }
});
