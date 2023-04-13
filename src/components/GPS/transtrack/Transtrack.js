import React, { useEffect } from "react";
import axios from "axios";
import { useHookstate } from "@hookstate/core";
import { DataTable } from "primereact/datatable";
import { Column } from "primereact/column";

function Transtrack() {
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

export default Transtrack;

// import { useEffect } from "react";
// import axios from "axios";
// import { useHookstate } from "@hookstate/core";
// import { DataTable } from "primereact/datatable";
// import { Column } from "primereact/column";

// function GPS() {
//   // const devicesState = useHookstate([]);
//   // const deviceList = useHookstate([]);

//   // useEffect(() => {
//   //   axios
//   //     .get(
//   //       "https://telematics.transtrack.id/api/get_devices?lang=en&user_api_hash=$2y$10$FAIEorvAA7Z7V/pDrVON7.w7LMRfcNak/SjyfvtEnhptKcXM3IgMy"
//   //     )
//   //     .then((response) => {
//   //       devicesState.set(response.data);
//   //       let data = response.data;
//   //       for (let i = 0; i <= data.length - 1; i++) {
//   //         let temp = data[i];
//   //         // console.log(temp.length);
//   //         for (let j = 0; j <= temp.items.length; j++) {
//   //           deviceList.set(temp.items);
//   //         }
//   //       }
//   //       // console.log(deviceList[0].name);
//   //     })
//   //     .catch((error) => {
//   //       console.log(error);
//   //     });
//   // }, [deviceList]);

//   // const devicesState = useHookstate([]);
//   const deviceList = useHookstate([]);

//   useEffect(() => {
//     axios
//       .get(
//         "https://telematics.transtrack.id/api/get_devices?lang=en&user_api_hash=$2y$10$FAIEorvAA7Z7V/pDrVON7.w7LMRfcNak/SjyfvtEnhptKcXM3IgMy"
//       )
//       .then((response) => {
//         // devicesState.set(response.data);
//         let data = response.data;
//         for (let i = 0; i <= data.length - 1; i++) {
//           let temp = data[i];
//           for (let j = 0; (j = temp.items.length); j++) {
//             let temps = temp.items;
//             deviceList.push(temps[j]);
//           }
//         }
//       })
//       .catch((error) => {
//         console.log(error);
//       });
//   }, [deviceList]);

//   return (
//     <DataTable value={deviceList.get()}>
//       <Column field="id" header="ID" />
//       <Column field="name" header="Name" />
//       <Column field="status" header="Status" />
//       {/* Add more columns as needed */}
//     </DataTable>
//   );
// }

// export default GPS;

// // src/components/PositionList.js

// import React, { useEffect } from "react";
// import { connect } from "react-redux";
// import { fetchDevices } from "./GPSAction";
// import { DataView } from "primereact/dataview";

// function GPS({ devices, error, fetchDevices }) {
//   useEffect(() => {
//     fetchDevices();
//   }, [fetchDevices]);

//   // let newItem = [];
//   // const listData = (item) => {
//   //   for (let i = 0; i <= item.length; i++) {
//   //     i = item;
//   //     for (let j = 0; j < i.items.length; j++) {
//   //       newItem.set(j);
//   //     }
//   //   }
//   // };

//   const itemTemplate = (item) => {
//     // console.log(item.id);
//     // return <div>{item.name}</div>;
//     for (let i in item) {
//       console.log(item[i].id);
//       return <div>{i.id}</div>;
//     }

//     // return (
//     //   <div className="p-col-12">
//     //     <div className="card">
//     //       <div className="card-body">
//     //         <h5 className="card-title">{item.items[0].name}</h5>
//     //         <p className="card-text">{item.id}</p>
//     //       </div>
//     //     </div>
//     //   </div>
//     // );
//   };

//   return (
//     <div>
//       {error && <div>{error}</div>}
//       <DataView value={devices} itemTemplate={itemTemplate} />
//     </div>
//   );
// }

// const mapStateToProps = (state) => {
//   return {
//     devices: state.devices,
//     error: state.error,
//   };
// };

// const mapDispatchToProps = {
//   fetchDevices,
// };

// export default connect(mapStateToProps, mapDispatchToProps)(GPS);

// import { useHookstate } from "@hookstate/core";
// import { useEffect } from "react";
// import axios from "axios";
// import { DataTable } from "primereact/datatable";
// import { Column } from "primereact/column";

// const GPS = () => {
//   const positionsState = useHookstate([]);

//   useEffect(() => {
//     axios
//       .get(
//         "https://telematics.transtrack.id/api/get_devices?lang=en&user_api_hash=$2y$10$FAIEorvAA7Z7V/pDrVON7.w7LMRfcNak/SjyfvtEnhptKcXM3IgMy"
//       )
//       .then((response) => {
//         console.log(response.data);
//         for (let i = 0; i <= response.data.length - 1; i++) {
//           // for(let j = 0; i.items)
//           console.log(i.value["items"].length);
//         }
//         // positionsState.set(response.data.devices);
//       })
//       .catch((error) => {
//         console.error(error);
//       });
//   }, []);

//   return (
//     <DataTable value={positionsState.get()}>
//       <Column field="device_id" header="Device ID"></Column>
//       <Column field="latitude" header="Latitude"></Column>
//       <Column field="longitude" header="Longitude"></Column>
//     </DataTable>
//   );
// };

// export default GPS;

// import React, { useState, useEffect } from "react";
// import axios from "axios";
// import { GoogleMap, Marker, Cluster } from "google-maps-react";
// import { useHookstate } from "@hookstate/core";
// import { DataTable } from "primereact/datatable";
// import { Column } from "primereact/column";

// const GPS = () => {
//   // Declare state variables
//   const devicesState = useHookstate([]);
//   const [deviceMarkers, setDeviceMarkers] = useState([]);

//   // Fetch device data from API on component mount
//   useEffect(() => {
//     const fetchData = async () => {
//       try {
//         const response = await axios.get(
//           "https://telematics.transtrack.id/api/get_devices?lang=en&user_api_hash=$2y$10$FAIEorvAA7Z7V/pDrVON7.w7LMRfcNak/SjyfvtEnhptKcXM3IgMy"
//         );
//         devicesState.set(response.data);
//       } catch (error) {
//         console.log(error);
//       }
//     };
//     fetchData();
//   }, []);

//   // Convert device data to markers
//   useEffect(() => {
//     const markers = devicesState.get().map((device) => ({
//       position: { lat: device.latitude, lng: device.longitude },
//       title: device.name,
//       animation: window.google.maps.Animation.DROP,
//     }));
//     setDeviceMarkers(markers);
//   }, [devicesState]);

//   return (
//     <div style={{ height: "calc(100vh - 100px)", width: "100%" }}>
//       <GoogleMap
//         google={window.google}
//         zoom={14}
//         initialCenter={{ lat: -6.2088, lng: 106.8456 }}>
//         <Cluster averageCenter enableRetinaIcons gridSize={60}>
//           {deviceMarkers.map((marker) => (
//             <Marker
//               key={marker.title}
//               position={marker.position}
//               title={marker.title}
//               animation={marker.animation}
//             />
//           ))}
//         </Cluster>
//       </GoogleMap>
//       <DataTable value={devicesState.get()}>
//         <Column field="name" header="Name" />
//         <Column field="latitude" header="Latitude" />
//         <Column field="longitude" header="Longitude" />
//       </DataTable>
//     </div>
//   );
// };

// export default GPS;
