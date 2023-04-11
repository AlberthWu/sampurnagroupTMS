import { Sidebar } from "primereact/sidebar";
import { Button } from "primereact/button";
import { Menu } from "primereact/menu";
import React, { useState } from "react";

const goToHome = () => {
  window.location.href = "/";
};

const Navigation = () => {
  const [visible, setVisible] = useState(false);

  const navlist = [
    {
      label: "Home",
      icon: "pi pi-fw pi-home",
      command: () => {
        window.location.href = "/";
      },
    },
    {
      label: "Product",
      icon: "pi pi-fw pi-file",
      command: () => {
        window.location.href = "/product";
      },
    },
    {
      label: "Contact",
      icon: "pi-pi-fw pi-phone",
      command: () => {
        window.location.href = "/contact";
      },
    },
    {
      label: "Login",
      icon: "pi-pi-fw pi-person",
      command: () => {
        window.location.href = "/login";
      },
    },
  ];

  const toogleMenu = () => {
    setVisible(!visible);
  };

  return (
    <div className="flex justify-content-between static px-4 w-full">
      <Button icon="pi pi-bars" onClick={toogleMenu} />
      <Sidebar visible={visible} onHide={() => setVisible(false)}>
        <Menu model={navlist} />
      </Sidebar>
      <h1>Authorization</h1>
      <Button icon="pi pi-home" onClick={goToHome}></Button>
    </div>
  );
};

export default Navigation;
