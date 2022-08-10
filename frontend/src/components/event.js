function Event(props) {
    const title = props.value.title;
    const body = props.value.body;
    const image = props.value.image;

    return (
        <div>
            <div>
                {title}
            </div>
            <div>
                {body}
            </div>
            <div>
                <img src={image}/>
            </div>
        </div>
    )
}

export default Event;
