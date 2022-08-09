import {Link} from "react-router-dom";
import Event from "./event";

function Events() {
    const news = [
        {id: 1, title: 'Test 1', body: 'Test body 1'},
        {id: 2, title: 'Test 2', body: 'Test body 2'},
    ];

    const ListNews = news.map((post) =>
        <Event key={post.id} value={post}/>
    );

    return (
        <div>
            <div>
                {ListNews}
            </div>
        </div>

    );
}

export default Events;
