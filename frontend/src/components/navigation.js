import { NavLink } from "react-router-dom";

function Navigation() {
  let activeClassName = "underline";

  return (
    <nav>
      <ul>
        <li>
          <NavLink
            to="events"
            className={({ isActive }) =>
              isActive ? activeClassName : undefined
            }
          >
            Events
          </NavLink>
        </li>
        <li>
          <NavLink
            to="/"
            className={({ isActive }) =>
              isActive ? activeClassName : undefined
            }
          >
            Home
          </NavLink>
        </li>
      </ul>
    </nav>
  );
}

export default Navigation;
