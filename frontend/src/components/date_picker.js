import React from 'react';

class DatePicker extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            from: null,
            to: null
        }
        this.handleChangeFrom = this.handleChangeFrom.bind(this);
        this.handleChangeTo = this.handleChangeTo.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    handleChangeFrom(e) {
        this.setState({from: e.target.value});
    }

    handleChangeTo(e) {
        this.setState({to: e.target.value});
    }

    handleSubmit(e) {
        e.preventDefault();
        this.props.onDateChange([this.state.from, this.state.to])
    }

    render() {
        return (
            <form onSubmit={this.handleSubmit}>
                <label>
                    От: <input onChange={this.handleChangeFrom} type="date" />
                </label>
                <label>
                    До: <input onChange={this.handleChangeTo} type="date" />
                </label>
                <input type="submit" value="Поиск"/>
            </form>
        );
    }
}

export default DatePicker;