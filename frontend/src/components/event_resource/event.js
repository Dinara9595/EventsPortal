import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";

function Event() {
  let { eventId } = useParams();
  const [isLoaded, setLoaded] = useState(false);
  const [event, setEvent] = useState(null);
  const [error, setError] = useState(null);

  useEffect(() => {
    fetch(`http://localhost:10524/api/v1/events/${eventId}`)
      .then((response) => response.json())
      .then(
        (result) => {
          setLoaded(true);
          setEvent(result.data);
        },
        (error) => {
          setLoaded(true);
          setError(error);
        }
      );
  });

  if (error) {
    return <div>Ошибка: {error.message} </div>;
  } else if (!isLoaded) {
    return <div>Загрузка...</div>;
  } else {
    return (
      <div>
        <div>{event.attributes.title}</div>
        <div>{event.attributes.body}</div>
        <div>
          <img src={event.attributes.image} />
        </div>
      </div>
    );
  }
}

export default Event;
