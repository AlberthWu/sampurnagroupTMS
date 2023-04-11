import React from "react";
import "primereact/resources/themes/luna-pink/theme.css";
import "primereact/resources/primereact.min.css";
import "primeicons/primeicons.css";
import Navigation from "./components/Nav";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import Contact from "./components/Contact";
import Product from "./components/Product";
import Login from "./components/Login";
// import { CookiesProvider } from "react-cookie";

const App = () => {
  return (
    <div className="d-flex">
      <Navigation />
      <BrowserRouter>
        <Routes>
          <Route path="/login" element={<Login />} />
          <Route path="/contact" element={<Contact />} />
          <Route path="/product" element={<Product />} />
          <Route path="/" element={null} />
        </Routes>
      </BrowserRouter>
    </div>
  );
};

export default App;
