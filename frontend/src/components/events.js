import Event from "./event";
import React from 'react';

class Events extends React.Component{
    constructor(props) {
        super(props);
        this.state = {
          error: null,
          isLoaded: false,
          news: []
        };
    }

    componentDidMount() {
        fetch('http://localhost:10524/api/v1/events')
            .then(response => response.json())
            .then(
                (result) => {
                    this.setState({
                        isLoaded: true,
                        news: result.data
                    });
                },
                (error) => {
                    this.setState({
                        isLoaded: true,
                        error
                    })
                }
            )
    }

    render() {
        const { error, isLoaded, news } = this.state;
        if (error) {
            return <div>Ошибка: {error.message} </div>;
        } else if (!isLoaded) {
            return <div>Загрузка...</div>;
        } else {
            return (
                <ul>
                    {news.map(post =>
                        <Event key={post.id} value={post.attributes}/>
                    )}
                </ul>
            );
        }
    }
}

export default Events;
