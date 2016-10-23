import React, { Component } from 'react';

class Quote extends Component {
  constructor(props) {
    super(props);
    this.state = {
      quote: '',
    }
  }

  componentDidMount() {
    $.ajax({
      url:'http://quotes.rest/quote/image.json',
      headers: {'X-TheySaidSo-Api-Secret' : 'vIGjh2UM2tJDFIADKiHwUweF' },
      beforeSend: function (request)
         {
          request.setRequestHeader("Access-Control-Allow-Headers");
         },
    })
    .done(data => {
      this.setState({
        quote: data.contents.qimage.download_uri
      })
      debugger;
    })
  }

  render() {
    return(
      <div className="quote">
          <img src={this.state.quote}/>
          <h4>-{this.state.author}</h4>
      </div>
    )
  }
}

export default Quote;
