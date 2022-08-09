import {Link} from "react-router-dom";

function Home () {
    const welcome = 'Добро пожаловать на наш портал новостей о котиках! '
    const content ='На этом портале вы узнаете самые последние новости о котах'
   // {/* const last_new = news.last */}

    return (
        <div>
            <div>
                <h1>{welcome}</h1>
            </div>
            <div>
                {content}
            </div>
            <div>
                {/* {last_new} */}
            </div>
        </div>
    );
}

export default Home;

