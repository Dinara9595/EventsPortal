import React from "react";
import Form from "react-bootstrap/Form";
import Button from "react-bootstrap/Button";
import Stack from "react-bootstrap/Stack";
import InputGroup from "react-bootstrap/InputGroup";

class DatePicker extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      from: null,
      to: null,
    };
    this.handleChangeFrom = this.handleChangeFrom.bind(this);
    this.handleChangeTo = this.handleChangeTo.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChangeFrom(e) {
    this.setState({ from: e.target.value });
  }

  handleChangeTo(e) {
    this.setState({ to: e.target.value });
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.onDateChange([this.state.from, this.state.to]);
  }

  render() {
    return (
      <Form onSubmit={this.handleSubmit}>
        <Stack direction="horizontal" gap={3}>
          <InputGroup>
            <InputGroup.Text>От:</InputGroup.Text>
            <Form.Control onChange={this.handleChangeFrom} type="date" />
          </InputGroup>
          <InputGroup>
            <InputGroup.Text>До:</InputGroup.Text>
            <Form.Control onChange={this.handleChangeTo} type="date" />
          </InputGroup>
          <Button variant="primary" type="submit">
            Поиск
          </Button>
        </Stack>
      </Form>
    );
  }
}

export default DatePicker;
