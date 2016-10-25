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
      url:'https://quotes.rest/quote/image.json?api_key=vIGjh2UM2tJDFIADKiHwUweF',
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
