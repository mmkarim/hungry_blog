var AllComments = React.createClass({
  handleDelete(comment_id) {
    this.props.handleDelete(comment_id)
  },
  render() {
    var comments = this.props.comments.map((comment) => {
      return(
        <div className="row" key={comment.id} >
          <div className="col-md-8">
            <div className="testimonials">
              <div className="active item">
                  <blockquote>
                    <h5><strong>{comment.email}</strong></h5>
                    <p>{comment.text}</p>
                    <small className="float-right">
                    <button onClick={this.handleDelete.bind(this, comment.id)} className="btn btn-danger btn-xs">Delete</button>
                    </small>
                  </blockquote>
                </div>
            </div>
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
