import './App.css';
import Events from './components/events.js';
import Home from './components/home.js';
import NotFound from './components/not_found.js';
import Navigation from "./components/navigation";
import {Routes, Route, NavLink} from "react-router-dom";


function App() {
  return (
      <div>
          {<Navigation/>}
        <Routes>
          <Route path="events" element={<Events />}/>
          <Route path="/" element={<Home />}/>
          <Route path="*" element={<NotFound />} />
        </Routes>
      </div>
  );
}

export default App;
