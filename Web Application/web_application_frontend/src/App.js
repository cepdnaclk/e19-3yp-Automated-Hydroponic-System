import React from "react";
import RoutesConfig from "../src/pages/4_Routing/RoutesConfig";
import {BrowserRouter as Router } from "react-router-dom";



function App() {
  return (
    <>
    <div>
      <Router basename="/">
        <RoutesConfig/>
      </Router>
    </div>
    </>
  );
}

export default App;
