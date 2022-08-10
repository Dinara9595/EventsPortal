import { Link } from "react-router-dom";
import Card from 'react-bootstrap/Card';

function List_item(props) {
  const title = props.value.title;
  const body = props.value.body;
  const image = props.value.image;

  return (
      <Card style={{ width: '50rem' }}>
          <Card.Img src={image} />
          <Card.Body>
              <Card.Title>{title}</Card.Title>
              <Card.Text>{body}</Card.Text>
              <Link to={props.id} class="btn btn-primary">Перейти к новости</Link>
          </Card.Body>
      </Card>
  );
}

export default List_item;
