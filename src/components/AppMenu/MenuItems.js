import { MenuItem } from "primereact/menuitem";
import { LayoutContext } from "../../layout/LayoutContext";
import { MenuProvicer } from "./AppMenuItems";
import Link from "next/link";
import { useContext } from "react";

const MenuItem = () => {
  const { layoutConfig } = useContext(LayoutContext);
  const model = [
    {
      label: "Home",
      items: [{ label: "Dashboard", icon: "pi pi-fw pi-home", to: "/" }],
    },
  ];
};
