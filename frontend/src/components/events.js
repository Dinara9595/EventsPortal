import Event from './event';
import React from 'react';
import DatePicker from './date_picker';

class Events extends React.Component{
    constructor(props) {
        super(props);
        this.state = {
            error: null,
            isLoaded: false,
            news: [],
            date_range: []
        };

        this.handleDateChange = this.handleDateChange.bind(this);
    }

    componentDidMount() {
        if (this.state.news.length === 0 ) {
            this.fetchEvents()
        }

        this.timerID = setInterval(
            () => this.fetchEvents(),
            10000
        );
    }

    componentWillUnmount() {
        clearInterval(this.timerID);
    }

    fetchEvents () {
        fetch(this.buildUrl())
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

    handleDateChange(input) {
        this.setState({date_range: input}, () => this.fetchEvents());
    }

    buildUrl() {
        const parsedUrl = new URL('http://localhost:10524/api/v1/events');

        if (this.state.date_range[0]) {
            parsedUrl.searchParams.set('start_date', this.state.date_range[0]);
        }

        if (this.state.date_range[1]) {
            parsedUrl.searchParams.set('end_date', this.state.date_range[1]);
        }

        return parsedUrl;
    }

    render() {
        const { error, isLoaded, news } = this.state;
        if (error) {
            return <div>Ошибка: {error.message} </div>;
        } else if (!isLoaded) {
            return <div>Загрузка...</div>;
        } else {
            return (
                <div>
                    <DatePicker onDateChange={this.handleDateChange}/>
                    <ul>
                        {news.map(post =>
                            <Event key={post.id} value={post.attributes}/>
                        )}
                    </ul>
                </div>
            );
        }
    }
}

export default Events;
