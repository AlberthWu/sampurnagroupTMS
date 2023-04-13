import React, { useEffect } from "react";
import axios from "axios";
import { useHookstate } from "@hookstate/core";
import { DataTable } from "primereact/datatable";
import { Column } from "primereact/column";

function EasyGo() {
  // const devicesState = useHookstate([]);
  const deviceList = useHookstate([]);

  useEffect(() => {
    axios
      .get(
        "https://telematics.transtrack.id/api/get_devices?lang=en&user_api_hash=$2y$10$FAIEorvAA7Z7V/pDrVON7.w7LMRfcNak/SjyfvtEnhptKcXM3IgMy"
      )
      .then((response) => {
        // devicesState.set(response.data);
        let data = response.data;
        let uniqueDevices = [];
        for (let i = 0; i <= data.length - 1; i++) {
          let temp = data[i];
          for (let j = 0; j <= temp.items.length - 1; j++) {
            uniqueDevices.push(temp.items[j]);
          }
        }
        deviceList.set([...new Set(uniqueDevices)]);
      })
      .catch((error) => {
        console.log(error);
      });
  }, []);

  return (
    <div>
      <DataTable value={deviceList.get()}>
        <Column field="id" header="ID" />
        <Column field="name" header="Name" />
        <Column field="status" header="Status" />
        {/* Add more columns as needed */}
      </DataTable>
    </div>
  );
}

export default EasyGo;
