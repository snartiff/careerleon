import React, { Component } from 'react';

class Quote extends Component {
  constructor(props) {
    super(props);
    this.state = {
      quote: '',
      author: '',
    }
  }

  componentDidMount() {
    $.ajax({
      url:'https://quotes.rest/qod.json'
      beforeSend: function (request)
           {
               request.setRequestHeader("Access-Control-Allow-Origin", "*");
           },
    })
    .done(data => {
      debugger;
      this.setState({
        author: data.contents.quotes[0].author,
        quote: data.contents.quotes[0].quote
      })
    })
  }

  render() {
    return(
      <div className="quote">
          <h2>"{this.state.quote}"</h2>
          <h4>-{this.state.author}</h4>
      </div>
    )
  }
}

export default Quote;
