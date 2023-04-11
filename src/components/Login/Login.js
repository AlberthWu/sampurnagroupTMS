import { useState } from "react";
import axios from "axios";
import { InputText } from "primereact/inputtext";
import { Button } from "primereact/button";
// import Cookies from "js-cookie";
import { Card } from "primereact/card";

const Login = () => {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  const url = "https://api.sampurna-group.com/v2/users/";
  // const url = "http://10.2.3.155:9080/v2/users/";

  const handleLogin = async (event) => {
    event.preventDefault();
    try {
      await axios
        .post(`${url}login`, { username, password }, { withCredentials: true })
        .then((response) => {
          // console.log(response.data.session.session_id);
          console.log(response);
          setIsLoggedIn(true);
          localStorage.setItem("token", response.data.session.session_id);
          console.log(localStorage);
        });

      // handle successful login
    } catch (error) {
      // handle login error
    }
  };

  const handleRefresh = async () => {
    try {
      const token = localStorage.getItem("token");
      console.log(`Ini token Refresh dari storage ${token}`);
      axios.defaults.headers.common["Authorization"] = `Bearer : ${token}`;
      await axios
        .post(`${url}refresh`, {}, { withCredentials: true })
        .then((response) => {
          console.log(`Ini token refresh ${response.data.session_id}`);
          console.log(response);
          setIsLoggedIn(true);
        });

      // handle successful login
    } catch (error) {
      // handle login error
    }
  };

  const handleLogout = async () => {
    try {
      const token = localStorage.getItem("token");
      console.log(`Ini token Logout ${token}`);
      await axios
        .post(`${url}logout`, {}, { withCredentials: true })
        .then((response) => {
          console.log(response);
          localStorage.removeItem("token");
          setIsLoggedIn(false);
        });

      // handle successful login
    } catch (error) {
      // handle login error
    }
  };

  if (localStorage.getItem("token" && !isLoggedIn)) {
    setIsLoggedIn(true);
  }

  const footer = () => {
    return (
      <div>
        <div className="flex align-items-start flex-wrap card-container">
          <div className="flex align-items-center justify-content-center font-bold text-gray-900 border-round m-2">
            <Button
              style={{ minWidth: "200px", minHeight: "50px" }}
              label="Login"
              onClick={handleLogin}
              className=" bg-green-500 "
            />
          </div>
          <div className="flex align-items-center justify-content-center font-bold text-gray-900 border-round m-2">
            <Button
              style={{ minWidth: "200px", minHeight: "50px" }}
              label="Refresh"
              onClick={handleRefresh}
              className=" bg-orange-500 "
            />
          </div>
          <div className="flex align-items-center justify-content-center font-bold text-gray-900 border-round m-2">
            <Button
              style={{ minWidth: "200px", minHeight: "50px" }}
              label="Logout"
              onClick={handleLogout}
              className=" bg-red-500 "
            />
          </div>
        </div>
      </div>
    );
  };

  return (
    <div>
      {!isLoggedIn ? (
        <div className="flex align-items-center justify-content-center">
          <Card
            title="LOGIN USER"
            footer={footer}
            className="flex align-items-center justify-content-center"
            style={{
              textAlign: "center",
              minWidth: "500px",
              minHeight: "400px",
              color: "black",
              background: "yellow",
            }}>
            <div
              className="p-inputgroup pb-2"
              style={{
                minWidth: "380px",
                background: "yellow",
              }}>
              <span className="p-inputgroup-addon">
                <i className="pi pi-user"></i>
              </span>
              <InputText
                value={username}
                onChange={(e) => setUsername(e.target.value)}
                placeholder="Username"
              />
            </div>
            <div className="p-inputgroup">
              <span className="p-inputgroup-addon">
                <i className="pi pi-lock"></i>
              </span>
              <InputText
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                placeholder="Password"
                type="password"
              />
            </div>
          </Card>
          {/* <div className="card">
            <div
              className="flex align-items-start flex-wrap card-container yellow-container"
              style={{ minHeight: "200px" }}>
              <div
                className="flex align-items-center justify-content-center bg-yellow-500 font-bold text-gray-900 border-round m-2"
                style={{ minWidth: "200px", minHeight: "50px" }}>
                1
              </div>
              <div
                className="flex align-items-center justify-content-center bg-yellow-500 font-bold text-gray-900 border-round m-2"
                style={{ minWidth: "200px", minHeight: "150px" }}>
                2
              </div>
              <div
                className="flex align-items-center justify-content-center bg-yellow-500 font-bold text-gray-900 border-round m-2"
                style={{ minWidth: "200px", minHeight: "100px" }}>
                3
              </div>
            </div> */}
          {/* </div> */}
          {/* <div className="p-inputgroup">
            <span className="p-inputgroup-addon">
              <i className="pi pi-user"></i>
            </span>
            <InputText
              value={username}
              onChange={(e) => setUsername(e.target.value)}
              placeholder="Username"
            />
          </div>
          <div className="p-inputgroup">
            <span className="p-inputgroup-addon">
              <i className="pi pi-lock"></i>
            </span>
            <InputText
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              placeholder="Password"
              type="password"
            />
          </div>
          <Button label="Login" onClick={handleLogin} />
          <Button label="Refresh" onClick={handleRefresh} />
          <Button label="Logout" onClick={handleLogout} /> */}
        </div>
      ) : (
        <div>
          <h1>success</h1>
          <Button label="Refresh" onClick={handleRefresh} />
          <Button label="Logout" onClick={handleLogout} />
          <Button label="Login" onClick={handleLogin} />
          <div></div>
        </div>
      )}
    </div>
  );
};

export default Login;
