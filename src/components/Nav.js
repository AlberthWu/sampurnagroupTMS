// import { Sidebar } from "primereact/sidebar";
// import { Button } from "primereact/button";
// import { Menu } from "primereact/menu";
import { MegaMenu } from "primereact/megamenu";
import React from "react";
// import React, { useState } from "react";

// const goToHome = () => {
//   window.location.href = "/";
// };

// const Navigation = () => {
//   // const [visible, setVisible] = useState(false);

//   const navlist = [
//     {
//       label: "Home",
//       icon: "pi pi-fw pi-home",
//       command: () => {
//         window.location.href = "/";
//       },
//     },
//     {
//       label: "Product",
//       icon: "pi pi-fw pi-file",
//       command: () => {
//         window.location.href = "/product";
//       },
//     },
//     {
//       label: "GPS",
//       icon: "pi-pi-fw pi-phone",
//       command: () => {
//         window.location.href = "/gps";
//       },
//     },
//     {
//       label: "Login",
//       icon: "pi-pi-fw pi-person",
//       command: () => {
//         window.location.href = "/login";
//       },
//     },
//   ];

//   // const toogleMenu = () => {
//   //   setVisible(!visible);
//   // };

//   return (
//     <div className="d-flex w-full pt-3 pb-3 bg-primary">
//       <div>
//         <MegaMenu
//           model={navlist}
//           style={{ width: "150rem" }}
//           breakpoint="960px"
//         />
//       </div>
//       {/* <Button icon="pi pi-bars" onClick={toogleMenu} />
//       <Sidebar visible={visible} onHide={() => setVisible(false)}>
//         <Menu model={navlist} />
//       </Sidebar>
//       <h1>Authorization</h1>
//       <Button icon="pi pi-home" onClick={goToHome}></Button> */}
//     </div>
//   );
// };

// export default Navigation;

const Navigation = () => {
  const items = [
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
      label: "GPS",
      items: [
        [
          {
            label: "Maps",
            items: [
              {
                label: "Transtrack",
                command: () => {
                  window.location.href = "/transtrack";
                },
              },
              {
                label: "EasyGo",
                command: () => {
                  window.location.href = "/easygo";
                },
              },
            ],
          },
        ],
        [
          {
            label: "Geofence",
            items: [
              {
                label: "Transtrack",
                command: () => {
                  window.location.href = "/transtrack";
                },
              },
              {
                label: "EasyGo",
                command: () => {
                  window.location.href = "/easygo";
                },
              },
            ],
          },
        ],
      ],
    },
    {
      label: "Login",
      icon: "pi pi-user",
      command: () => {
        window.location.href = "/login";
      },
    },
  ];

  return (
    <div className="d-flex w-full pb-3">
      <div className="card" style={{ backgroundcolor: "white" }}>
        <MegaMenu model={items} />
      </div>
    </div>
  );
};

export default Navigation;
