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
    })
  }

  render() {
    return(
      <div className="quote">
          <img id="qimg" src={this.state.quote} onClick={this.componentDidMount.bind(this)}/>
      </div>
    )
  }
}


export default Quote;
