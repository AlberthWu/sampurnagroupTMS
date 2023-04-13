import React from "react";
import "primereact/resources/themes/arya-blue/theme.css";
import "primereact/resources/primereact.min.css";
import "primeicons/primeicons.css";
import Navigation from "./components/Nav";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import Transtrack from "./components/GPS/transtrack/Transtrack";
import EasyGo from "./components/GPS/easyGo/EasyGo";
import Product from "./components/Product";
import Login from "./components/Login/Login";
// import { CookiesProvider } from "react-cookie";

// import { Provider } from "react-redux";
// import { createStore, applyMiddleware } from "redux";
// import thunk from "redux-thunk";
// import reducer from "./components/GPS/GPSStore";

// const store = createStore(reducer, applyMiddleware(thunk));

const App = () => {
  return (
    // <div className="d-flex">
    <div className="header">
      <Navigation />
      <BrowserRouter>
        <Routes>
          <Route path="/login" element={<Login />} />
          <Route path="/product" element={<Product />} />
          <Route path="/transtrack" element={<Transtrack />} />
          <Route path="/easygo" element={<EasyGo />} />
          <Route path="/" element={null} />
        </Routes>
      </BrowserRouter>
    </div>
    // </div>
  );
};

export default App;
