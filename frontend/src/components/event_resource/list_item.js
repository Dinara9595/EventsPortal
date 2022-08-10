import { Link } from "react-router-dom";

function List_item(props) {
  const title = props.value.title;
  const body = props.value.body;
  const image = props.value.image;

  return (
    <div>
      <div>
        <Link to={props.id}>{title}</Link>
      </div>
      <div>{body}</div>
      <div>
        <img src={image} />
      </div>
    </div>
  );
}

export default List_item;
