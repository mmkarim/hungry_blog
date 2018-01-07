var AllComments = React.createClass({
  handleDelete(commentId) {
    this.props.handleDelete(commentId)
  },

  deleteButton(commentId) {
    if(!!this.props.jwt) {
      return (
        <button
          onClick={this.handleDelete.bind(this, commentId)}
          className="btn btn-danger btn-xs">
            Delete
        </button>
      )
    } else {
      return null;
    }
  },

  render() {
    var comments = this.props.comments.map((comment) => {
      return(
        <div className="row" key={comment.id} >
          <div className="col-sm-8">
            <div className="testimonials">
              <div className="active item">
                  <blockquote>
                    <h5><strong>{comment.email}</strong></h5>
                    <p className="text-muted">{comment.text}</p>
                    <p className="small">{comment.time} ago</p>
                  </blockquote>
                </div>
            </div>
          </div>
          <div className="col-sm-2">
            {this.deleteButton(comment.id)}
          </div>
        </div>
      )
    });

    return (
      <div className="content">
        {comments}
      </div>
    )
  }
});
