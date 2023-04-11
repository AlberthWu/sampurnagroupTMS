import React from "react";
import "primereact/resources/themes/arya-blue/theme.css";
import "primereact/resources/primereact.min.css";
import "primeicons/primeicons.css";
import Navigation from "./components/Nav";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import GPS from "./components/GPS/GPS";
import Product from "./components/Product";
import Login from "./components/Login/Login";
// import { CookiesProvider } from "react-cookie";

const App = () => {
  return (
    // <div className="d-flex">
    <div className="header">
      <Navigation />
      <BrowserRouter>
        <Routes>
          <Route path="/login" element={<Login />} />
          <Route path="/gps" element={<GPS />} />
          <Route path="/product" element={<Product />} />
          <Route path="/" element={null} />
        </Routes>
      </BrowserRouter>
    </div>
    // </div>
  );
};

export default App;
