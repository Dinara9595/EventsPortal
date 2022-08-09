function Event(props) {
    const title = props.value.title;
    const body = props.value.body;
    return (
        <div>
            <div>
                {title}
            </div>
            <div>
                {body}
            </div>
        </div>
    )
}

export default Event;
