import "./App.css";
import Event from "./components/event_resource/event.js";
import EventList from "./components/event_resource/event_list.js";
import Home from "./components/home.js";
import NotFound from "./components/not_found.js";
import Navigation from "./components/navigation";
import { Routes, Route } from "react-router-dom";

function App() {
  return (
    <div>
      {<Navigation />}
      <Routes>
        <Route path="events" element={<EventList />} />
        <Route path="events/:eventId" element={<Event />} />
        <Route path="/" element={<Home />} />
        <Route path="*" element={<NotFound />} />
      </Routes>
    </div>
  );
}

export default App;
